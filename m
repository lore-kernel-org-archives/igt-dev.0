Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA0B10E312
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 16:54:33 +0000 (UTC)
Date: Tue, 24 Oct 2023 18:53:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231024165350.wynbj7cn67tr7owk@kamilkon-desk.igk.intel.com>
References: <20231020133041.58257-1-adrinael@adrinael.net>
 <20231020133041.58257-2-adrinael@adrinael.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231020133041.58257-2-adrinael@adrinael.net>
Subject: Re: [igt-dev] [PATCH 2/3] runner/runner_tests: Unit tests for
 binary-name-only testlist entries
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

Please add a description here, see checkpatch.pl:

WARNING: Missing commit description - Add an appropriate one

On 2023-10-20 at 16:30:40 +0300, Petri Latvala wrote:
> Signed-off-by: Petri Latvala <adrinael@adrinael.net>
> ---
>  runner/runner_tests.c | 70 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index a7e968f85..e6024de11 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -1810,6 +1810,76 @@ igt_main
>  		}
>  	}
>  
> +	igt_subtest_group {
> +		const char testlisttext[] = "igt@successtest";

WARNING: const array should probably be static const

> +		const char blocktext[] = "igt@successtest@first";
Same here.

> +		struct job_list *list = malloc(sizeof(*list));
> +		volatile int dirfd = -1;

WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
Maybe static?

> +		char dirname[] = "tmpdirXXXXXX";
> +		volatile int listfd;
--------^
Same here.

> +		volatile int blockfd;
--------^
Same here.

> +		char listfilename[] = "tmplistXXXXXX";
> +		char blockfilename[] = "tmpblockXXXXXX";
> +
> +		igt_fixture {
> +			igt_require(mkdtemp(dirname) != NULL);
> +			rmdir(dirname);
> +
> +			igt_require((listfd = mkstemp(listfilename)) >= 0);
> +			igt_require(write(listfd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
> +			igt_require((blockfd = mkstemp(blockfilename)) >= 0);
> +			igt_require(write(blockfd, blocktext, strlen(blocktext)) == strlen(blocktext));
> +			close(listfd);
> +			close(blockfd);
> +
> +			init_job_list(list);
> +		}
> +
> +		igt_subtest("only-binary-name-in-testlist") {
> +			const char *argv[] = { "runner",

WARNING: char * array declaration might be better as static const

> +				"--allow-non-root",
> +				"--test-list", listfilename,
> +				testdatadir,
> +				dirname,
> +			};
> +
> +			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));

ERROR: "(foo**)" should be "(foo **)"

> +
> +			igt_assert(create_job_list(list, settings));
> +			/* No multi-mode, binary has two subtests, should be normalized to have individual subtests */
> +			igt_assert_eq(list->size, 2);
> +			igt_assert_eq(list->entries[0].subtest_count, 1);
> +			igt_assert_eq(list->entries[1].subtest_count, 1);
> +		}
> +
> +		igt_subtest("only-binary-name-in-testlist-with-blocks") {
> +			const char *argv[] = { "runner",

WARNING: char * array declaration might be better as static const

> +				"--allow-non-root",
> +				"--test-list", listfilename,
> +				"-b", blockfilename,
> +				testdatadir,
> +				dirname,
> +			};
> +
> +			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));

ERROR: "(foo**)" should be "(foo **)"

Looks ok, tests passes.

Regards,
Kamil

> +
> +			igt_assert(create_job_list(list, settings));
> +			/* No multi-mode, binary has two subtests, one of them blocked */
> +			igt_assert_eq(list->size, 1);
> +			igt_assert_eq(list->entries[0].subtest_count, 1);
> +			igt_assert_eqstr(list->entries[0].subtests[0], "second-subtest");
> +		}
> +
> +		igt_fixture {
> +			unlink(listfilename);
> +			unlink(blockfilename);
> +			close(dirfd);
> +			clear_directory(dirname);
> +			free_job_list(list);
> +			free(list);
> +		}
> +	}
> +
>  	igt_subtest_group {
>  		struct job_list *list = malloc(sizeof(*list));
>  		volatile int dirfd = -1;
> -- 
> 2.39.2
> 
