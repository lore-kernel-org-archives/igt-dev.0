Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D33310E085
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 04:34:44 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 1 Dec 2023 04:34:39 +0000
Message-ID: <BYAPR11MB341333F97FEC84229A6DD567D081A@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20231129102628.30848-1-sai.gowtham.ch@intel.com>
 <MW3PR11MB4748A289C0B4DF02804F1925AE83A@MW3PR11MB4748.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB4748A289C0B4DF02804F1925AE83A@MW3PR11MB4748.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] intel/xe_exec_store.c: Fix the check
 for num of placements in store_all.
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



>-----Original Message-----
>From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
>Sent: Wednesday, November 29, 2023 5:25 PM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; igt-dev@lists.freedesktop.=
org;
>Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Subject: RE: [igt-dev] [PATCH i-g-t] intel/xe_exec_store.c: Fix the check =
for num of
>placements in store_all.
>
>
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> sai.gowtham.ch@intel.com
>> Sent: Wednesday, November 29, 2023 3:56 PM
>> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
>> <sai.gowtham.ch@intel.com>
>> Subject: [igt-dev] [PATCH i-g-t] intel/xe_exec_store.c: Fix the check
>> for num of placements in store_all.
>>
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Adjust the store_all execution with dynamic subtest, so that test will
>> skip the engines with no instances and executes on the engines with inst=
ances.
>>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_exec_store.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
>> index
>> 9c14bfd14..95c678bf7 100644
>> --- a/tests/intel/xe_exec_store.c
>> +++ b/tests/intel/xe_exec_store.c
>> @@ -245,7 +245,8 @@ static void store_all(int fd, int gt, int class)
>>  		eci[num_placements++] =3D *hwe;
>>  	}
>>
>> -	igt_require(num_placements);
>> +	igt_skip_on_f(!num_placements, "Engine class:%d gt:%d not enabled on
>> this platform\n",
>> +			class, gt);
>>
>>  	for (i =3D 0; i < num_placements; i++) {
>>  		struct drm_xe_exec_queue_create create =3D { @@ -304,10
>> +305,13 @@ igt_main
>>  	igt_subtest("basic-store")
>>  		store(fd);
>>
>> -	igt_subtest("basic-all") {
>> +	igt_subtest_with_dynamic("basic-all") {
>>  		xe_for_each_gt (fd, gt)
>> -			xe_for_each_hw_engine_class(class)
>> -				store_all(fd, gt, class);
>> +			xe_for_each_hw_engine_class (class) {
>The problem here is, test is failing as we are trying to check all the eng=
ine classes
>on all gt's. Test is skipping in cases where the engine class is not prese=
nt on a
>particular engine or an hardware.
>
>Here the correct solution will be using " xe_for_each_hw_engine " instead =
of using
>xe_for_each_gt and xe_for_each_hw_engine_class.
>
>xe_for_each_hw_engine internally uses query ioctl to get the existing engi=
nes info
>on a hardware. Each engine id, class, instance , gt id is returned which c=
an be used
>to pass gt and class data to store_all.
>
>JFYI
>xe_for_each_gt - iterates over all gt's
>xe_for_each_hw_engine_class - loop iterates over all the known engines cla=
sses
>including the ones which are not present on the GT or on the platform.
>
>By passing only existing engine class info, above check "
>igt_require(num_placements)" won't be required.
You are right, however If you look at the code in store_all we are querying=
 num_placements=20
From xe_for_each_hw_engine. And we use that num_placements later for engine=
 creation.=20

Previously test was skipping the entire test when it hits gt with engine cl=
ass has 0 instances, however intension of this patch is to=20
Skip only if gt with engine class has 0 instances and execute rest of the t=
est.=20
=20
Thanks,
Gowtham
>
>Thanks,
>Rahul
>> +				igt_dynamic_f("class-%d", class) {
>> +					store_all(fd, gt, class);
>> +				}
>> +			}
>>  	}
>>
>>  	igt_subtest("cachelines")
>> --
>> 2.39.1
