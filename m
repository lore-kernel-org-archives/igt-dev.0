Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <158022544274.20534.12830596180736565523@emeril.freedesktop.org>
References: <20200128114801.12282-1-petri.latvala@intel.com>
 <158022544274.20534.12830596180736565523@emeril.freedesktop.org>
Message-ID: <158022697117.2129.13610280385807886022@skylake-alporthouse-com>
Date: Tue, 28 Jan 2020 15:56:11 +0000
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Make_sure_output_is_still_collected_when_killing_test_due_t?=
 =?utf-8?q?o_taint?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Patchwork <patchwork@emeril.freedesktop.org>, Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Patchwork (2020-01-28 15:30:42)
> == Series Details ==
> 
> Series: runner: Make sure output is still collected when killing test due to taint
> URL   : https://patchwork.freedesktop.org/series/72657/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5394 -> IGTPW_4016
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with IGTPW_4016 need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4016, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4016:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - fi-cml-s:           [FAIL][1] ([fdo#103375]) -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

Incomplete or Timeout?

Starting subtest: basic-S3
[160.045053] Killing the test because the kernel is tainted.
[160.119964] Aborting: Kernel badly tainted (0x240) (check dmesg for details):
	(0x200) TAINT_WARN: WARN_ON has happened.

I'd rather have stern purple than whimsical blue.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
