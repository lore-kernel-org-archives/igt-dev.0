Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BE410E5DE
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jun 2022 15:51:26 +0000 (UTC)
Date: Wed, 29 Jun 2022 17:51:12 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <20220629175112.5e705b59@maurocar-mobl2>
In-Reply-To: <20220628094435.854519-3-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
 <20220628094435.854519-3-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/7] runner: make the usage function
 variadic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 28 Jun 2022 11:44:30 +0200
Ryszard Knop <ryszard.knop@intel.com> wrote:

> For easier error logging, make the usage() function variadic and pass
> its arguments to vfprintf. Additionally, reorder its arguments so that
> it visually matches all the printf functions.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  runner/settings.c | 63 ++++++++++++++++++++++-------------------------
>  1 file changed, 30 insertions(+), 33 deletions(-)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 06947c91..d153954a 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -295,10 +295,16 @@ static const char *usage_str =
>  	"                        this option if given.\n"
>  	;
>  
> -static void usage(const char *extra_message, FILE *f)
> +static void usage(FILE *f, const char *extra_message, ...)
>  {
> -	if (extra_message)
> -		fprintf(f, "%s\n\n", extra_message);
> +	if (extra_message) {
> +		va_list args;
> +
> +		va_start(args, extra_message);
> +		vfprintf(f, extra_message, args);
> +		fputs("\n\n", f);
> +		va_end(args);
> +	}
>  
>  	fputs(usage_str, f);
>  }
> @@ -310,12 +316,7 @@ static bool add_regex(struct regex_list *list, char *new)
>  
>  	regex = g_regex_new(new, G_REGEX_OPTIMIZE, 0, &error);
>  	if (error) {
> -		char *buf = malloc(snprintf(NULL, 0, "Invalid regex '%s': %s", new, error->message) + 1);
> -
> -		sprintf(buf, "Invalid regex '%s': %s", new, error->message);
> -		usage(buf, stderr);
> -
> -		free(buf);
> +		usage(stderr, "Invalid regex '%s': %s", new, error->message);
>  		g_error_free(error);
>  		return false;
>  	}
> @@ -549,7 +550,7 @@ bool parse_options(int argc, char **argv,
>  			print_version();
>  			goto error;
>  		case OPT_HELP:
> -			usage(NULL, stdout);
> +			usage(stdout, NULL);
>  			goto error;
>  		case OPT_NAME:
>  			settings->name = strdup(optarg);
> @@ -574,7 +575,7 @@ bool parse_options(int argc, char **argv,
>  			break;
>  		case OPT_DISK_USAGE_LIMIT:
>  			if (!parse_usage_limit(settings, optarg)) {
> -				usage("Cannot parse disk usage limit", stderr);
> +				usage(stderr, "Cannot parse disk usage limit");
>  				goto error;
>  			}
>  			break;
> @@ -583,7 +584,7 @@ bool parse_options(int argc, char **argv,
>  			break;
>  		case OPT_LOG_LEVEL:
>  			if (!set_log_level(settings, optarg)) {
> -				usage("Cannot parse log level", stderr);
> +				usage(stderr, "Cannot parse log level");
>  				goto error;
>  			}
>  			break;
> @@ -631,7 +632,7 @@ bool parse_options(int argc, char **argv,
>  			break;
>  		case OPT_PRUNE_MODE:
>  			if (!set_prune_mode(settings, optarg)) {
> -				usage("Cannot parse prune mode", stderr);
> +				usage(stderr, "Cannot parse prune mode");
>  				goto error;
>  			}
>  			break;
> @@ -644,10 +645,10 @@ bool parse_options(int argc, char **argv,
>  			settings->list_all = true;
>  			break;
>  		case '?':
> -			usage(NULL, stderr);
> +			usage(stderr, NULL);
>  			goto error;
>  		default:
> -			usage("Cannot parse options", stderr);
> +			usage(stderr, "Cannot parse options");
>  			goto error;
>  		}
>  	}
> @@ -664,7 +665,7 @@ bool parse_options(int argc, char **argv,
>  		case 0:
>  			break;
>  		default:
> -			usage("Too many arguments for --list-all", stderr);
> +			usage(stderr, "Too many arguments for --list-all");
>  			goto error;
>  		}
>  	} else {
> @@ -677,10 +678,10 @@ bool parse_options(int argc, char **argv,
>  			settings->results_path = absolute_path(argv[optind]);
>  			break;
>  		case 0:
> -			usage("Results-path missing", stderr);
> +			usage(stderr, "Results-path missing");
>  			goto error;
>  		default:
> -			usage("Extra arguments after results-path", stderr);
> +			usage(stderr, "Extra arguments after results-path");
>  			goto error;
>  		}
>  		if (!settings->name) {
> @@ -697,7 +698,7 @@ bool parse_options(int argc, char **argv,
>  	}
>  
>  	if (!settings->test_root) {
> -		usage("Test root not set", stderr);
> +		usage(stderr, "Test root not set");
>  		goto error;
>  	}
>  
> @@ -714,17 +715,17 @@ bool validate_settings(struct settings *settings)
>  	int dirfd, fd;
>  
>  	if (settings->test_list && !readable_file(settings->test_list)) {
> -		usage("Cannot open test-list file", stderr);
> +		usage(stderr, "Cannot open test-list file");
>  		return false;
>  	}
>  
>  	if (!settings->results_path) {
> -		usage("No results-path set; this shouldn't happen", stderr);
> +		usage(stderr, "No results-path set; this shouldn't happen");
>  		return false;
>  	}
>  
>  	if (!settings->test_root) {
> -		usage("No test root set; this shouldn't happen", stderr);
> +		usage(stderr, "No test root set; this shouldn't happen");
>  		return false;
>  	}
>  
> @@ -780,23 +781,24 @@ bool serialize_settings(struct settings *settings)
>  	FILE *f;
>  
>  	if (!settings->results_path) {
> -		usage("No results-path set; this shouldn't happen", stderr);
> +		usage(stderr, "No results-path set; this shouldn't happen");
>  		return false;
>  	}
>  
>  	if ((dirfd = open(settings->results_path, O_DIRECTORY | O_RDONLY)) < 0) {
>  		mkdir(settings->results_path, 0755);
>  		if ((dirfd = open(settings->results_path, O_DIRECTORY | O_RDONLY)) < 0) {
> -			usage("Creating results-path failed", stderr);
> +			usage(stderr, "Creating results-path failed");
>  			return false;
>  		}
>  	}
> +
>  	if (settings->enable_code_coverage) {
>  		strcpy(path, settings->results_path);
>  		strcat(path, CODE_COV_RESULTS_PATH);
>  		if ((covfd = open(path, O_DIRECTORY | O_RDONLY)) < 0) {
>  			if (mkdir(path, 0755)) {
> -				usage("Creating code coverage path failed", stderr);
> +				usage(stderr, "Creating code coverage path failed");
>  				return false;
>  			}
>  		} else {
> @@ -806,24 +808,19 @@ bool serialize_settings(struct settings *settings)
>  
>  	if (!settings->overwrite &&
>  	    faccessat(dirfd, settings_filename, F_OK, 0) == 0) {
> -		usage("Settings metadata already exists and not overwriting", stderr);
> +		usage(stderr, "Settings metadata already exists and not overwriting");
>  		return false;
>  	}
>  
>  	if (settings->overwrite &&
>  	    unlinkat(dirfd, settings_filename, 0) != 0 &&
>  	    errno != ENOENT) {
> -		usage("Error removing old settings metadata", stderr);
> +		usage(stderr, "Error removing old settings metadata");
>  		return false;
>  	}
>  
>  	if ((fd = openat(dirfd, settings_filename, O_CREAT | O_EXCL | O_WRONLY, 0666)) < 0) {
> -		char *msg;
> -
> -		asprintf(&msg, "Creating settings serialization file failed: %s", strerror(errno));
> -		usage(msg, stderr);
> -
> -		free(msg);
> +		usage(msg, "Creating settings serialization file failed: %s", strerror(errno));
>  		close(dirfd);
>  		return false;
>  	}
