Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEE310E031
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 12:16:09 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 29 Nov 2022 13:16:00 +0100
From: aemad <aemad@igalia.com>
To: Alex Hung <alex.hung@amd.com>
In-Reply-To: <f605162c-f374-9268-3cc9-579dd68363c2@amd.com>
References: <cover.1668154709.git.aemad@igalia.com>
 <35b8b7adb1e5671c2c1ae43ba7ce4774@igalia.com>
 <f605162c-f374-9268-3cc9-579dd68363c2@amd.com>
Message-ID: <5c96437128e41514a0ae88a6c2dff8dd@igalia.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH RFC i-g-t 0/8] tests/kms_universal_plane:
 divide `functional_test_pipe` to mini-subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Alex,

On 2022-11-17 22:35, Alex Hung wrote:
> Hi Aemad,
> 
> Thanks for breaking the test into smaller subtests.
> 
> Some GPU drivers, including amdgpu, do not allow primary plane off
> without turning crtc off
> (https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c#L385),
> but kms_universal_plane has many the below code which was guarded with
> is_amdgpu_device()
> 
>         igt_plane_set_fb(primary, NULL);
>         igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
> 
> Many of the is_amdgpu_device() are not present in your patches and
> kms_universal fails. I needed to add is_amdgpu_device() to patch 2~3
> and 5~7 (I didn't check 8).
> 
> -------------------------

Thanks for your feedback, I will add AMD guard and resend them again.

BR,
Alaa

> 
> From: aemad <aemad@igalia.com>
> Sent: 11 November 2022 01:31
> To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> Cc: petri.latvala@intel.com <petri.latvala@intel.com>;
> bhanuprakash.modem@intel.com <bhanuprakash.modem@intel.com>;
> ville.syrjala@linux.intel.com <ville.syrjala@linux.intel.com>;
> Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Hung, Alex
> <Alex.Hung@amd.com>; markyacoub@chromium.org
> <markyacoub@chromium.org>; mwen@igalia.com <mwen@igalia.com>;
> andrealmeid@igalia.com <andrealmeid@igalia.com>
> Subject: Re: [PATCH RFC i-g-t 0/8] tests/kms_universal_plane: divide
> `functional_test_pipe` to mini-subtests 
> 
> Please, let me know your thoughts.
> 
> On 2022-11-11 09:29, Alaa Emad wrote:
>> Divide the `functional_test_pipe` test into seven subtests based on
> CRC
>> comparisons because this will make it easier to debug the test and
> help
>> in detecting the failure.
>>
>> First 7 patches decouple each subtest and run it individually
> keeping
>> `functional_test_pipe' test as it is. After making sure that each
>> subtest can run individually with the expected result on both vkms
> and i915
>> drivers, improve the test by creating `run_functional_test_pipe` and
>> call all subtests from it and call `run_functional_test_pipe` in
>> `igt_main`.
>>
>>
>> Alaa Emad (8):
>>   tests/kms_universal_plane: decouple verification of legacy and
> atomic
>>     api
>>   tests/kms_universal_plane: decouple verification of disabling
> primary
>>     plane
>>   tests/kms_universal_plane: decouple verification of re-enabling
>>     primary plane
>>   tests/kms_universal_plane: decouple verification of setup plane
> FB's
>>     while CRTC is disabled
>>   tests/kms_universal_plane: decouple verification of ablity to
> modeset
>>     with the primary plane off
>>   tests/kms_universal_plane: decouple verification of ablity to move
> the
>>     primary plane completely offscreen
>>   tests/kms_universal_plane: decouple verification of ablity to
>>     explicitly disable an already implicitly-disabled primary plane
>>   tests/kms_universal_plane: create the run_functional_test_pipe and
>>     call all tests from it
>>
>>  tests/kms_universal_plane.c | 416
> ++++++++++++++++++++++--------------
>>  1 file changed, 261 insertions(+), 155 deletions(-)
