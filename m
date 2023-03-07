Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D9C10E38A
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 09:19:55 +0000 (UTC)
Date: Tue, 7 Mar 2023 10:19:51 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230307101951.11836867@maurocar-mobl2>
In-Reply-To: <20230302110947.548610-9-zbigniew.kempczynski@intel.com>
References: <20230302110947.548610-1-zbigniew.kempczynski@intel.com>
 <20230302110947.548610-9-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v4 8/8] runner/job_list: return error on
 crashes while running --list-subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu,  2 Mar 2023 12:09:47 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> Changes on tests may break --list-subtests, if they, for instance,
> someone adds a code outside igt_subtests that depends on igt_fixture
> to run, causing:
>=20
>         Received signal SIGABRT.
>         Stack trace:
>          #0 [fatal_sig_handler+0x17b]
>          #1 [__sigaction+0x50]
>          #2 [__pthread_kill_implementation+0x10c]
>          #3 [gsignal+0x16]
>          #4 [abort+0xd7]
>          #5 [__assert_fail_base.cold+0xf]
>          #6 [__assert_fail+0x46]
>          #7 [internal_assert+0xe5]
>          #8 [igt_fail+0xea]
>          #9 [__igt_fail_assert+0x10e]
>          #10 [xe_number_hw_engines+0x6b]
>          #11 [__igt_unique____real_main1528+0x1ac0]
>          #12 [main+0x23]
>          #13 [__libc_start_call_main+0x80]
>          #14 [__libc_start_main+0x89]
>          #15 [_start+0x25]
>         Aborted (core dumped)
>=20
> IGT runner currently prints the message, but don't ignore the
> error. That prevents scripts to rely on the IGT testlist
> output, as the list will miss subtests.
>=20
> So, instead, return an error.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  runner/job_list.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/runner/job_list.c b/runner/job_list.c
> index a259b9531a..e6ea836310 100644
> --- a/runner/job_list.c
> +++ b/runner/job_list.c
> @@ -130,6 +130,7 @@ static void add_subtests(struct job_list *job_list, s=
truct settings *settings,
>  		}
>  	} else {
>  		fprintf(stderr, "Test binary %s died unexpectedly\n", binary);
> +		exit(1);
>  	}
>  }
> =20
