Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE08A10E3DB
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jun 2022 15:48:15 +0000 (UTC)
Date: Wed, 29 Jun 2022 17:48:10 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <20220629174810.7476b4d4@maurocar-mobl2>
In-Reply-To: <20220628094435.854519-2-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
 <20220628094435.854519-2-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] runner: rename free_settings to
 clear_settings
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

On Tue, 28 Jun 2022 11:44:29 +0200
Ryszard Knop <ryszard.knop@intel.com> wrote:

> That function does not actually free the settings pointer - rename it
> for clarity.

Yeah, despite freeing several settings-> functions, as it doesn't free
setting itself, I guess it is fair to rename it to clear_settings().

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  runner/executor.c     |  2 +-
>  runner/resultgen.c    |  2 +-
>  runner/runner_tests.c | 12 ++++++------
>  runner/settings.c     |  8 ++++----
>  runner/settings.h     |  6 +++---
>  5 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 6e6ca9cc..9b89cc09 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1547,7 +1547,7 @@ bool initialize_execute_state_from_resume(int dirfd,
>  	struct job_list_entry *entry;
>  	int resdirfd, fd, i;
>  
> -	free_settings(settings);
> +	clear_settings(settings);
>  	free_job_list(list);
>  	memset(state, 0, sizeof(*state));
>  	state->resuming = true;
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 6ecf325b..8e11b2b1 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1702,7 +1702,7 @@ struct json_object *generate_results_json(int dirfd)
>  		close(fd);
>  	}
>  
> -	free_settings(&settings);
> +	clear_settings(&settings);
>  	free_job_list(&job_list);
>  
>  	return obj;
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index 8fe86978..aca031fc 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -139,7 +139,7 @@ static void job_list_filter_test(const char *name, const char *filterarg1, const
>  	}
>  
>  	igt_fixture {
> -		free_settings(settings);
> +		clear_settings(settings);
>  		free(settings);
>  	}
>  }
> @@ -953,7 +953,7 @@ igt_main
>  			close(fd);
>  			close(dirfd);
>  			clear_directory(dirname);
> -			free_settings(cmp_settings);
> +			clear_settings(cmp_settings);
>  			free(cmp_settings);
>  		}
>  	}
> @@ -1176,7 +1176,7 @@ igt_main
>  			igt_assert(write(fd, journaltext, strlen(journaltext)) == strlen(journaltext));
>  
>  			free_job_list(list);
> -			free_settings(settings);
> +			clear_settings(settings);
>  			igt_assert(initialize_execute_state_from_resume(dirfd, &state, settings, list));
>  
>  			igt_assert_eq(state.next, 0);
> @@ -1233,7 +1233,7 @@ igt_main
>  			igt_assert(write(fd, journaltext, strlen(journaltext)) == strlen(journaltext));
>  
>  			free_job_list(list);
> -			free_settings(settings);
> +			clear_settings(settings);
>  			igt_assert(initialize_execute_state_from_resume(dirfd, &state, settings, list));
>  
>  			/* All subtests are in journal, the entry should be considered completed */
> @@ -1294,7 +1294,7 @@ igt_main
>  			igt_assert_eq(write(fd, journaltext, sizeof(journaltext)), sizeof(journaltext));
>  
>  			free_job_list(list);
> -			free_settings(settings);
> +			clear_settings(settings);
>  			igt_assert(initialize_execute_state_from_resume(dirfd, &state, settings, list));
>  
>  			igt_assert_eq(state.next, 1);
> @@ -1942,7 +1942,7 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		free_settings(settings);
> +		clear_settings(settings);
>  		free(settings);
>  	}
>  }
> diff --git a/runner/settings.c b/runner/settings.c
> index bb63a9f4..06947c91 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -486,7 +486,7 @@ void init_settings(struct settings *settings)
>  	memset(settings, 0, sizeof(*settings));
>  }
>  
> -void free_settings(struct settings *settings)
> +void clear_settings(struct settings *settings)
>  {
>  	free(settings->test_list);
>  	free(settings->name);
> @@ -536,7 +536,7 @@ bool parse_options(int argc, char **argv,
>  		{ 0, 0, 0, 0},
>  	};
>  
> -	free_settings(settings);
> +	clear_settings(settings);
>  
>  	optind = 1;
>  
> @@ -705,7 +705,7 @@ bool parse_options(int argc, char **argv,
>  	return true;
>  
>   error:
> -	free_settings(settings);
> +	clear_settings(settings);
>  	return false;
>  }
>  
> @@ -939,7 +939,7 @@ bool read_settings_from_dir(struct settings *settings, int dirfd)
>  	int fd;
>  	FILE *f;
>  
> -	free_settings(settings);
> +	clear_settings(settings);
>  
>  	if ((fd = openat(dirfd, settings_filename, O_RDONLY)) < 0)
>  		return false;
> diff --git a/runner/settings.h b/runner/settings.h
> index 6ae64695..6d444d01 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -76,14 +76,14 @@ struct settings {
>  void init_settings(struct settings *settings);
>  
>  /**
> - * free_settings:
> + * clear_settings:
>   *
>   * Releases all allocated resources for a settings object and
>   * initializes it to an empty state (see #init_settings).
>   *
> - * @settings: Object to release and initialize.
> + * @settings: Object to release and reinitialize.
>   */
> -void free_settings(struct settings *settings);
> +void clear_settings(struct settings *settings);
>  
>  /**
>   * parse_options:
