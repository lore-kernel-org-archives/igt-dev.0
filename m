Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0769C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 17:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2776F112637;
	Fri, 22 Mar 2024 17:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHKFI9QY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B0110E723
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711127580; x=1742663580;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rE9uX4Lmy1NfzSUAGDalBzm/mRY5hzfpFWhtYQunFQo=;
 b=ZHKFI9QYzDepOJqTilkuBRaQ15I7Q8SiqGtXdCQ3EaYXiZJGhF+CexB0
 6IhBfEekg/AiezPQ8CGlpqs7fF7igJf1xPPFWXlcJzuXaSl4a5FzBO3XB
 Hfvik1lk6RRXegTi7a1Zme5qcp0ectkqSYnmHHvy3ALUOhl691tJhLqPr
 +AjSqeZZjZdFzaAkrhQQkD0QbkMw5yM8wHZYgvhJbSXqSBZ57efgqhgWs
 LI/Sjkd7WzYamLy9kNXNQXB6bUmmXfIfzjXTXmIFNyPFsXLRh4vuP66Z2
 /0kzdBCOwc245x24MU4PDY6ek+L90haLs+4cmKYCBxh39BG+FoPoHZFvo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17580909"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17580909"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14868994"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 10:13:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:12:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:12:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 10:12:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDRpgrs347hPjefHK0xOHj4PLcgh/73b/qETmIsNHfahG+rVDNP/6pkrljb6R04EisKxLorUiLcgMO8rpFP9oAqHhFbEX3q61FIE2GtIbwaO09e2g3kQ09Mxm/lhevRP8IdsV/ABkUTU9uCgRGLe80Sj9VFzBTRFnO/E+Ft5QHC8q05S9AY3U0fT4dQRaL0F2Y6svcqGKVpmWNISI1ECsd1v9OwGbl6jkN6QHB4lOwMfrMG/nnNtMM691LK6RK59UgL5HZC+o4MwdbCFoGhIsot3Qf7amBxdHw+HVlYIPqzuh3pasRmwY3agXMVVgCwW1UqvGM/tXomK5hyfNonMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xHb6swsyMoLDGM7cMSHD7NO9PdtHtwYnOfYKzf3/3M=;
 b=MNWAso44JccQH3egLxWQUzSTrN+96F1hoyHSipS8dsrcdffiAfu1NvFNgg2g6W4Cyhvr547IHtK63kw9eCe1jyxhuV7pInVTzmzT4ksloGFEz6W6gfebBPzAj3hgtnCIv9qKPLdPa0/+fwr2OX8x6Gap+DKtwG2rr0u9wfFB4btvLhZAUirh+UbWKUfR1nVP0eWk064eRGtzs63Wc/3+x9qXftoMEy3cbzLd6ckEmEHn3cWz881SSDey7auUv/b82WaqXL2pJjW79vBCp0zKUdr4n+Ilw5/0GykoCMO1wrQXt8ugf8+3UK9mXCAZL0d5k402DOofF4S7J/uNgGcgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 17:12:53 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:12:53 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume
Thread-Index: AQHadpaO6r1E2c2P+UmSvbRDN5hB87FCshSAgAFXB9A=
Date: Fri, 22 Mar 2024 17:12:53 +0000
Message-ID: <BL3PR11MB5747241A692E97CED6C6C908D0312@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240315050536.21319-1-sai.gowtham.ch@intel.com>
 <20240315050536.21319-2-sai.gowtham.ch@intel.com>
 <ZfyameoGTqYNABKO@intel.com>
In-Reply-To: <ZfyameoGTqYNABKO@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|SA0PR11MB4528:EE_
x-ms-office365-filtering-correlation-id: c2c707d0-77d3-48f0-80c4-08dc4a934fcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8vhKqTbKJcpmFmY5u/NoiOfyarFVOQBAEvbphMp45wa9AVeuQCHMnhdeqDSyC69AmepJ03WEZWIiB+JTdgw4JJG+PmiY2JXKglbXl8Q+ApsGsVXMUzOC74nZXFJBFiIhNBsNVGsMp+Bq2r8Uo74j4sqmNA57/QpuZaoVepRZjOmto8bDAU8ui+ZQV5YKGGei1xsZdoesb4LvTYcuptwtknTp7P0ntI47+Rjwh7tGAcU1vJnCUkjf6sFz1RcCsoPryvJKc8/fooRFzEnRvwTtA8Sgnup0eRnT4S0aNzHmqELJOzuc7+cDVxPe45AA8oj7+aeRR7tmOkCyBQVKNm5xauAv4ZYtz7rzskvChtw0CZn1RHCxXRyeGR4SaJY/NOqD7RqGcYfJop7Q4FnFJemN4Mi+sy6SHVdo6+f1W209IfdQu1vMWvN1v1rVjuzPuTpn+91b6gvcroeONybvIF6xplEiiNR3IEbOIemnta6U9MdsceZJUZXOMJ8BwilL58qsUWwZ0sKjypmQGI13mAmxuM4q5QlrMQTk6IXWjoqYUgdY92qluQEe2vBsTOoiFHJXXXpYzmcG8/9uITxoG6TgMFpQlxB0yTa1GquWXT08msnOTKTbHRZSOQNlpwPxDYu8iifCbhn8Fp7b9GemVLx+ATD9e83uN68E1Vj7+4ygqDhtMcn4z1foAmKZKw2eHZV1s2AYC47ZZvlzqCm+tuxU0g8jKcj303ZhSP/vgkPvZQw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?udivV0LmXXwF7C2bKsPwnTi4nzFQbFngHwj+4DNLPK0y/W0KYS9CrAA3bY+S?=
 =?us-ascii?Q?yuHRhEvgIjDsCS6SJobcVC6qFKbXOGqexgC990XhcHozFWW2rI5Y7zg5Tdvm?=
 =?us-ascii?Q?Tk7HOHAMllGiDivDQL2ep0PUVunA67/8Gj4X/832yRzdl3p9VzgNe61vjkE+?=
 =?us-ascii?Q?AoelolSUPsA8IY2Q0zwso56s+qA/PxZsjta9X5bMYAfGhf/feKWoqBHd/pgj?=
 =?us-ascii?Q?J/gwjzatTd3ZgPT/6Gvy35OLBh8IykuXeK5aXuxF3ZLqyoeCPsV9V6OIWHKs?=
 =?us-ascii?Q?wqXArEvsm2yq0O1sEkUJks+k3LafTfB9IgJvEUTT8K8Tc1ltJEeGxfyJW680?=
 =?us-ascii?Q?BgqtLNqR72Jzyh6eLuz5+C+D9mNsgbw4DkhrtYmo/Smmggsgj+Yt6dUCttME?=
 =?us-ascii?Q?Jebk20U18sVLyu11Dv653e3xRl/1ch/JyEP7gsgXvRMH3eKxjCedqxjEIYWu?=
 =?us-ascii?Q?KfDznBk9Y4774GkWSVAeM01rMVuryhBqjD891uWcc/koNbx/y89CKEweO4Sn?=
 =?us-ascii?Q?iRsNh/2Rf8LjINf3isTsJfBK2rTh1OOyHpbZbWP6KDiNl4sHGH8dRy2SeA9L?=
 =?us-ascii?Q?bxtpndA8lrW4qFAaaE9GwGUbDOzmSCDZ9SCLXhJa6QXC8sCXLaEo9BQlfhGn?=
 =?us-ascii?Q?w3fMw7PDA7aVPrNLyx8XThT4qbm55IuZnixM2wQtJW4klfXQALfnNIgHMNVd?=
 =?us-ascii?Q?oVQ0m1cNovaxiRe6nhIw2xXOlWanGpII9xVHZaqMJutmAvrQYDqmq0Qf/HCZ?=
 =?us-ascii?Q?xLKk0ZYhMJcTsSiP+YtHEysHiNS7Ph58RwpVmrGGav2Zk/dZrLGmyKJWOG9S?=
 =?us-ascii?Q?uD25MQzc3n13W8+0mxM6UTqGU9uACg/ckVq3vr7QAcKp0FR4wRKqbaM8sYTV?=
 =?us-ascii?Q?TqhF0BOTmrk3Rm2kTCyhvjyR7AmvRSwxURNNYvUGfB8SlXcess4lKzmb1xqF?=
 =?us-ascii?Q?K2ZelY/Yw7T6UAubAUxPUJffIGIxxRSBk4A2vH1PEoIp5N297+N/sqMxc8cf?=
 =?us-ascii?Q?QXUA9xM1BKc7Uw+w+s3AxjmRhqtUtsectzqZSC2e1NecMrVStXosiNrzy59i?=
 =?us-ascii?Q?+4yJnzz5oA8/jG9jp5VmJslaXwt6Om7/ZJ8g/M7VRsPpt5M8en4n5u1IR9N6?=
 =?us-ascii?Q?lxfZiTR9Di+FrxclXLCVVO+JHvGHqk2FD4Pm4K8/RZJCv80dJcdjQUVrxVjx?=
 =?us-ascii?Q?ctJv7/S4e1R63eeyF6SOIc5MqcHNRMXbtU13O5qCJSQe5wyc/0jnSihnIHX0?=
 =?us-ascii?Q?Rc8ghKWSILlffEYyEkYUWJQy6Q+ljTaXmOPItBaSR0agQaVWE/imNJ6JphcR?=
 =?us-ascii?Q?VoVzvBPHiqAzGAxqoWSsb2YDv8/sLgvpW0fQilePwGOflh4Tg0jCzMBpYbGb?=
 =?us-ascii?Q?E0uEDu+JpmAtoHRY+cpEwhrijoUpnU+oTM39ruK287ftpV3o/kqVqLAJjVrU?=
 =?us-ascii?Q?HDrcwvhwMoe/WxEwShhuzPyaR2kheViT+4s3PDLZvGGv64Lc7VZA4tJDKZXB?=
 =?us-ascii?Q?IeCpIPHFWXdHmBWM3x77ifOc5xh7b/ZVz4c1go5GD2REWQXedHVbZYEqHIn5?=
 =?us-ascii?Q?etROoNoQHX0e68DhVzstZ6iFINBP7DVp60eoP5rk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c707d0-77d3-48f0-80c4-08dc4a934fcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 17:12:53.8667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYKwdGV148jLsphsbUcjKgAtPBHtY3F4SPvWopBkKaT3yieqrTn2KzG1OiW2ht+gEtOSrHTWb0EpNTfEadzOjunjejtk8uedROAGMYbQGsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Friday, March 22, 2024 2:08 AM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Cc: igt-dev@lists.freedesktop.org
>Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_pm: Test to validate vm bind
>functionality with suspend and resume
>
>On Fri, Mar 15, 2024 at 10:35:35AM +0530, sai.gowtham.ch@intel.com wrote:
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Test validates vm bind functionality, by suspend and resuming the
>> device after binding VM to a VA.
>>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_pm.c | 103
>> ++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 84 insertions(+), 19 deletions(-)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
>> fcbed6249..ac402e757 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -33,6 +33,9 @@
>>  #define MAGIC_1 0xc0ffee
>>  #define MAGIC_2 0xdeadbeef
>>
>> +#define USERPTR         (0x1 << 0)
>> +#define PREFETCH        (0x1 << 5)
>
>why 0 and 5?
>
>> +
>>  typedef struct {
>>  	int fd_xe;
>>  	struct pci_device *pci_xe;
>> @@ -273,10 +276,28 @@ static void close_fw_handle(int sig)
>>   * @d3cold:	d3cold
>>   */
>>
>> +/**
>> + * SUBTEST: %s-vm-bind-%s
>> + * DESCRIPTION: Test to check suspend/autoresume on %arg[1] state
>> + * 		with vm bind %arg[2] combination
>> + * Functionality: pm - %arg[1]
>> + *
>> + * arg[1]:
>> + *
>> + * @s2idle:	s2idle
>> + * @s3:         s3
>> + * @s4:         s4
>> + *
>> + * arg[2]:
>> + *
>> + * @basic:	basic
>> + * @usrptr:	usrptr
>> + * @prefetch:	prefetch
>> + */
>>  static void
>>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>>  	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
>> -	  enum igt_acpi_d_state d_state)
>> +	  enum igt_acpi_d_state d_state, unsigned int flags, bool test_vm)
>>  {
>>  	uint32_t vm;
>>  	uint64_t addr =3D 0x1a0000;
>> @@ -308,7 +329,6 @@ test_exec(device_t device, struct
>> drm_xe_engine_class_instance *eci,
>>
>>  	if (check_rpm)
>>  		igt_assert(in_d3(device, d_state));
>> -
>>  	vm =3D xe_vm_create(device.fd_xe, 0, 0);
>>
>>  	if (check_rpm)
>> @@ -320,21 +340,45 @@ test_exec(device_t device, struct
>drm_xe_engine_class_instance *eci,
>>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>>  		rpm_usage =3D igt_pm_get_runtime_usage(device.pci_xe);
>>
>> -	bo =3D xe_bo_create(device.fd_xe, vm, bo_size,
>> -			  vram_if_possible(device.fd_xe, eci->gt_id),
>> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> -	data =3D xe_bo_map(device.fd_xe, bo, bo_size);
>> +	if (flags & USERPTR)
>> +		data =3D aligned_alloc(xe_get_default_alignment(device.fd_xe),
>bo_size);
>> +	else {
>> +		if (flags & PREFETCH)
>> +			bo =3D xe_bo_create(device.fd_xe, 0, bo_size,
>> +					  all_memory_regions(device.fd_xe) |
>> +					  vram_if_possible(device.fd_xe, 0),
>> +
>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +		else
>> +			bo =3D xe_bo_create(device.fd_xe, 0, bo_size,
>> +					  vram_if_possible(device.fd_xe, eci-
>>gt_id),
>> +
>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +		data =3D xe_bo_map(device.fd_xe, bo, bo_size);
>> +	}
>> +	memset(data, 0, bo_size);
>>
>>  	for (i =3D 0; i < n_exec_queues; i++) {
>>  		exec_queues[i] =3D xe_exec_queue_create(device.fd_xe, vm, eci, 0);
>>  		bind_exec_queues[i] =3D 0;
>>  		syncobjs[i] =3D syncobj_create(device.fd_xe, 0);
>> -	};
>> +	}
>>
>>  	sync[0].handle =3D syncobj_create(device.fd_xe, 0);
>>
>> -	xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
>> -			 bo_size, sync, 1);
>> +	if (bo) {
>> +		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0,
>addr,
>> +				 bo_size, sync, 1);
>> +	} else {
>> +		xe_vm_bind_userptr_async(device.fd_xe, vm,
>bind_exec_queues[0],
>> +					 to_user_pointer(data), addr,
>> +					 bo_size, sync, 1);
>> +	}
>> +
>> +	if (flags & PREFETCH)
>> +		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0,
>addr,
>> +								bo_size, sync, 1,
>0);
>
>This patch is changing too much at once without explanation.
>Please split the series. All this userptr and prefetch should be both in s=
eparate
>patches.
>
>In the current way it is hard to follow on why you need all the changes ab=
ove.
>
Will split the changes in to different patches in my next version.
>> +
>> +	if (test_vm)
>> +		igt_system_suspend_autoresume(s_state,
>SUSPEND_TEST_NONE);
>
>these 2 lines seems to be the only part that is in the commit message itse=
lf, and,
>thinking about this while looking the code it looks like this line is not =
even needed
>because we would already taking care of this need with the
>system_suspend_autoresume call below right along with the exec?
>
>or what is this bringing?
Intension was to do suspend and resume right after vm_binds and after submi=
tting exec, However=20
to validate vm-bind combination I feel it should be fine to do S&R once sho=
uld be fine, which test_exec is=20
already doing, will be removing this line.=20

Thanks,
Gowtham
>
>>
>>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) >
>rpm_usage); @@
>> -398,9 +442,10 @@ NULL));
>>  			xe_exec_queue_destroy(device.fd_xe,
>bind_exec_queues[i]);
>>  	}
>>
>> -	munmap(data, bo_size);
>> -
>> -	gem_close(device.fd_xe, bo);
>> +	if (bo) {
>> +		munmap(data, bo_size);
>> +		gem_close(device.fd_xe, bo);
>> +	}
>>
>>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) <
>rpm_usage); @@
>> -585,6 +630,16 @@ igt_main
>>  		{ NULL },
>>  	};
>>
>> +	const struct vm_op {
>> +		const char *name;
>> +		unsigned int flags;;
>> +	} vm_op[] =3D {
>> +		{ "basic", 0 },
>
>perhaps you need a proper for the ops,
>adding the 0 there instead of hardcoding it here?
>
>> +		{ "usrptr", USERPTR },
>> +		{ "prefetch", PREFETCH },
>> +		{ NULL },
>> +	};
>> +
>>  	igt_fixture {
>>  		memset(&device, 0, sizeof(device));
>>  		device.fd_xe =3D drm_open_driver(DRIVER_XE); @@ -594,7 +649,7
>@@
>> igt_main
>>
>>  		/* Always perform initial once-basic exec checking for health */
>>  		xe_for_each_engine(device.fd_xe, hwe)
>> -			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
>> +			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0,
>0);
>>
>>  		igt_pm_get_d3cold_allowed(device.pci_slot_name,
>&d3cold_allowed);
>>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
>> @@ -611,7 +666,7 @@ igt_main
>>  		igt_subtest_f("%s-basic-exec", s->name) {
>>  			xe_for_each_engine(device.fd_xe, hwe)
>>  				test_exec(device, hwe, 1, 2, s->state,
>> -					  NO_RPM);
>> +					  NO_RPM, 0, 0);
>>  		}
>>
>>  		igt_subtest_f("%s-exec-after", s->name) { @@ -619,13 +674,13
>@@
>> igt_main
>>  						      SUSPEND_TEST_NONE);
>>  			xe_for_each_engine(device.fd_xe, hwe)
>>  				test_exec(device, hwe, 1, 2, NO_SUSPEND,
>> -					  NO_RPM);
>> +					  NO_RPM, 0, 0);
>>  		}
>>
>>  		igt_subtest_f("%s-multiple-execs", s->name) {
>>  			xe_for_each_engine(device.fd_xe, hwe)
>>  				test_exec(device, hwe, 16, 32, s->state,
>> -					  NO_RPM);
>> +					  NO_RPM, 0, 0);
>>  		}
>>
>>  		for (const struct d_state *d =3D d_states; d->name; d++) { @@ -
>633,10
>> +688,20 @@ igt_main
>>  				igt_assert(setup_d3(device, d->state));
>>  				xe_for_each_engine(device.fd_xe, hwe)
>>  					test_exec(device, hwe, 1, 2, s->state,
>> -						  NO_RPM);
>> +						  NO_RPM, 0, 0);
>>  				cleanup_d3(device);
>>  			}
>>  		}
>> +
>> +		for (const struct vm_op *op =3D vm_op; op->name; op++) {
>> +			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
>> +				xe_for_each_engine(device.fd_xe, hwe)
>> +					test_exec(device, hwe, 16, 32, s->state,
>> +						  NO_RPM, op->flags, 1);
>> +			}
>> +		}
>> +
>> +
>>  	}
>>
>>  	for (const struct d_state *d =3D d_states; d->name; d++) { @@ -650,7
>> +715,7 @@ igt_main
>>  			igt_assert(setup_d3(device, d->state));
>>  			xe_for_each_engine(device.fd_xe, hwe)
>>  				test_exec(device, hwe, 1, 1,
>> -					  NO_SUSPEND, d->state);
>> +					  NO_SUSPEND, d->state, 0, 0);
>>  			cleanup_d3(device);
>>  		}
>>
>> @@ -658,7 +723,7 @@ igt_main
>>  			igt_assert(setup_d3(device, d->state));
>>  			xe_for_each_engine(device.fd_xe, hwe)
>>  				test_exec(device, hwe, 16, 32,
>> -					  NO_SUSPEND, d->state);
>> +					  NO_SUSPEND, d->state, 0, 0);
>>  			cleanup_d3(device);
>>  		}
>>  	}
>> --
>> 2.39.1
>>
