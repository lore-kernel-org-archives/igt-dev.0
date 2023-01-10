Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660DF10E18C
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jan 2023 18:29:50 +0000 (UTC)
Message-ID: <f23c7ed6-b82b-84f4-919f-c25dc45aa48a@amd.com>
Date: Tue, 10 Jan 2023 11:29:44 -0700
To: Alaa Emad <aemad@igalia.com>, igt-dev@lists.freedesktop.org
References: <cover.1673098992.git.aemad@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <cover.1673098992.git.aemad@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH RFC i-g-t v2 0/8] tests/kms_universal_plane:
 divide `functional_test_pipe` to mini-subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2023-01-07 06:45, Alaa Emad wrote:
> Divide the `functional_test_pipe` test into seven subtests based on CRC
> comparisons because this will make it easier to debug the test and help
> in detecting the failure.
> 
> First 7 patches decouple each subtest and run it individually keeping
> `functional_test_pipe' test as it is. After making sure that each
> subtest can run individually with the expected result on both vkms and i915
> drivers, improve the test by creating `run_functional_test_pipe` and
> call all subtests from it and call `run_functional_test_pipe` in
> `igt_main`.
> 
> -------
> changes in v2:
> 	add is_amdgpu_device() guard.
> Alaa Emad (8):
>    tests/kms_universal_plane: decouple verification of legacy and atomic
>      api
>    tests/kms_universal_plane: decouple verification of disabling primary
>      plane
>    tests/kms_universal_plane: decouple verification of re-enabling
>      primary plane
>    tests/kms_universal_plane: decouple verification of setup plane FB's
>      while CRTC is disabled
>    tests/kms_universal_plane: decouple verification of ablity to modeset
>      with the primary plane off
>    tests/kms_universal_plane: decouple verification of ablity to move the
>      primary plane completely
>    tests/kms_universal_plane: decouple verification of ablity to
>      explicitly disable an already implicitly-disabled primary plane
>    tests/kms_universal_plane: create the run_functional_test_pipe and
>      call all tests from it
> 
>   tests/kms_universal_plane.c | 412 ++++++++++++++++++++++++------------
>   1 file changed, 272 insertions(+), 140 deletions(-)
> 
Hi Alaa,

There are trailing spaces in some patches (1, 4, 5, 7, 8):

$ git am 
RFC-i-g-t-v2-1-8-tests-kms_universal_plane-decouple-verification-of-legacy-and-atomic-api.patch
Applying: tests/kms_universal_plane: decouple verification of legacy and 
atomic api
.git/rebase-apply/patch:82: trailing whitespace.
	
$ git am 
RFC-i-g-t-v2-4-8-tests-kms_universal_plane-decouple-verification-of-setup-plane-FB-s-while-CRTC-is-disabled.patch
Applying: tests/kms_universal_plane: decouple verification of setup 
plane FB's while CRTC is disabled
.git/rebase-apply/patch:87: trailing whitespace.

$ git am 
RFC-i-g-t-v2-5-8-tests-kms_universal_plane-decouple-verification-of-ablity-to-modeset-with-the-primary-plane-off.patch
Applying: tests/kms_universal_plane: decouple verification of ablity to 
modeset with the primary plane off
.git/rebase-apply/patch:93: trailing whitespace.

$ git am 
RFC-i-g-t-v2-7-8-tests-kms_universal_plane-decouple-verification-of-ablity-to-explicitly-disable-an-already-implicitly-disabled-primary-plane.patch
Applying: tests/kms_universal_plane: decouple verification of ablity to 
explicitly disable an already implicitly-disabled primary plane
.git/rebase-apply/patch:108: trailing whitespace.

$ git am 
RFC-i-g-t-v2-8-8-tests-kms_universal_plane-create-the-run_functional_test_pipe-and-call-all-tests-from-it.patch
Applying: tests/kms_universal_plane: create the run_functional_test_pipe 
and call all tests from it
.git/rebase-apply/patch:57: trailing whitespace.
	
.git/rebase-apply/patch:646: trailing whitespace.
	
.git/rebase-apply/patch:771: trailing whitespace.
		igt_subtest_group {	
.git/rebase-apply/patch:786: trailing whitespace.
					
.git/rebase-apply/patch:800: trailing whitespace.
