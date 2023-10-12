Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F5F10E03A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 12:19:12 +0000 (UTC)
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Date: Thu, 12 Oct 2023 12:19:08 +0000
Message-ID: <BYAPR11MB2710342528E104962785A711A3D3A@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20231011084222.226352-1-shawn.c.lee@intel.com>
 <a514f33c-650e-a306-836c-98f2b8602a77@linux.intel.com>
 <ZSfZb6QTiUlBAPqw@ideak-desk>
In-Reply-To: <ZSfZb6QTiUlBAPqw@ideak-desk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests: read engine name again before restore
 timeout value
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: "20231011084222.226352-1-shawn.c.lee@intel.com"
 <20231011084222.226352-1-shawn.c.lee@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

2023-10-06T04:09:49.998264Z INFO kernel: [    0.255038] idma64 idma64.2: Fo=
und Intel integrated DMA 64-bit
2023-10-06T04:09:49.998285Z INFO kernel: [    0.322711] i915 0000:00:02.0: =
[drm] Finished loading DMC firmware i915/mtl_dmc.bin (v2.16)
2023-10-06T04:09:49.998286Z  ERR kernel: [    0.342093] i915 0000:00:02.0: =
[drm] *ERROR* Unlocked WOPCM regs with media GT
2023-10-06T04:09:49.998368Z INFO kernel: [    0.345039] i915 0000:00:02.0: =
[drm] GT0: GuC firmware i915/mtl_guc_70.bin version 70.8.0
2023-10-06T04:09:49.998387Z INFO kernel: [    0.357664] i915 0000:00:02.0: =
[drm] GT0: GUC: submission enabled
2023-10-06T04:09:49.998387Z INFO kernel: [    0.357666] i915 0000:00:02.0: =
[drm] GT0: GUC: SLPC enabled
2023-10-06T04:09:49.998389Z INFO kernel: [    0.357970] i915 0000:00:02.0: =
[drm] GuC RC: enabled
2023-10-06T04:09:49.998423Z INFO kernel: [    0.362337] i915 0000:00:02.0: =
[drm] GT1: GuC firmware i915/mtl_guc_70.bin version 70.8.0
2023-10-06T04:09:49.998424Z INFO kernel: [    0.362338] i915 0000:00:02.0: =
[drm] GT1: HuC firmware i915/mtl_huc_gsc.bin version 8.5.4
2023-10-06T04:09:49.998425Z  ERR kernel: [    0.362339] i915 0000:00:02.0: =
[drm] *ERROR* GT1: Unsuccessful WOPCM partitioning
2023-10-06T04:09:49.998435Z  ERR kernel: [    0.362399] i915 0000:00:02.0: =
[drm] *ERROR* GT1: GuC initialization failed -E2BIG
2023-10-06T04:09:49.998436Z  ERR kernel: [    0.362400] i915 0000:00:02.0: =
[drm] *ERROR* GT1: Enabling uc failed (-5)
2023-10-06T04:09:49.998440Z  ERR kernel: [    0.362401] i915 0000:00:02.0: =
[drm] *ERROR* GT1: Failed to initialize GPU, declaring it wedged!
2023-10-06T04:09:49.998451Z NOTICE kernel: [    0.362736] i915 0000:00:02.0=
: [drm:add_taint_for_CI] CI tainted:0x9 by intel_gt_init+0x1c6/0x303



On Thursday, October 12, 2023 7:33 PM, Deak, Imre wrote:
>On Thu, Oct 12, 2023 at 09:53:44AM +0100, Tvrtko Ursulin wrote:
>>=20
>> On 11/10/2023 09:42, Lee Shawn C wrote:
>> > We encounter a unexpected error on chrome book device while running=20
>> > this test. The tool will restore GPU engine's timeout value but open=20
>> > incorrect file name (XR24 in below). This is a workaround patch to=20
>> > avoid this problem before we got the root cause.
>> >=20
>> > openat(AT_FDCWD, "/sys/dev/char/226:0", O_RDONLY) =3D 12
>> > openat(12, "dev", O_RDONLY)             =3D 13
>> > read(13, "226:0\n", 1023)               =3D 6
>> > close(13)                               =3D 0
>> > openat(12, "engine", O_RDONLY)          =3D 13
>> > close(12)                               =3D 0
>> > openat(13, "XR24", O_RDONLY)            =3D -1 ENOENT (No such file or=
 directory)
>> >=20
>> > Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> > Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/147
>> > ---
>> >   tests/intel/kms_busy.c | 10 ++++++++--
>> >   1 file changed, 8 insertions(+), 2 deletions(-)
>> >=20
>> > diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c index=20
>> > 5b620658fb18..119e6f1652ce 100644
>> > --- a/tests/intel/kms_busy.c
>> > +++ b/tests/intel/kms_busy.c
>> > @@ -414,9 +414,15 @@ static void gpu_engines_init_timeouts(int fd, int=
 max_engines,
>> >   	}
>> >   }
>> > -static void gpu_engines_restore_timeouts(int fd, int num_engines,=20
>> > const struct gem_engine_properties *props)
>> > +static void gpu_engines_restore_timeouts(int fd, int num_engines,=20
>> > +struct gem_engine_properties *props)
>> >   {
>> > -	int i;
>> > +	const struct intel_execution_engine2 *e;
>> > +	int i =3D 0;
>> > +
>> > +	for_each_physical_engine(fd, e) {
>> > +		props[i].engine =3D e;
>> > +		i++;
>> > +	}
>> >   	for (i =3D 0; i < num_engines; i++)
>> >   		gem_engine_properties_restore(fd, &props[i]);
>>=20
>> By the look of it bug is in gpu_engines_init_timeouts(). This pointer
>> assignment:
>>=20
>> 	for_each_physical_engine(fd, e) {
>> 		igt_assert(*num_engines < max_engines);
>>=20
>> 		props[*num_engines].engine =3D e;
>>=20
>> ^^^ e is on stack, in scope of for_each_physical_engine, so by the=20
>> time
>> gpu_engines_restore_timeouts() runs it can legitimately point to=20
>> garbage, like XR24 in your example.
>>=20

Hi Tvrtko,

Thanks for your suggestion! Try to allocate memory and copy e's data.
Then assign this pointer to props[].engine. It can fix this issue as well.

Best regards,
Shawn

>> Your workaround works, although strictly don't think the order of=20
>> engines is guaranteed. Which is also moot since same preempt_timeout=20
>> and hearbeat_interval is used for all.
>>=20
>> Nevertheless, proper fix would be to allocate a make a copy of each=20
>> engine and store a pointer to that. It might be an overkill but, up=20
>> for discussion I guess.
>>=20
>> Fixes: 9e635a1c5029 ("tests/kms_busy: Ensure GPU reset when waiting=20
>> for a new FB during modeset")
>>=20
>> So I'll be cheeky and add Imre and Juha-Pekka too.
>
>ugh, thanks for catching this.
>
>Would it work to save the engine class/instance instead in gpu_engines_ini=
t_timeouts(), and look up the engines using these in
>gpu_engines_restore_timeouts() ?
>
>>=20
>> Regards,
>>=20
>> Tvrtko
