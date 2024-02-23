Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CEAC48BC4
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 09:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A3B10EB4F;
	Fri, 23 Feb 2024 09:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQTLbPWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E79F10EB4F
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708680516; x=1740216516;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lqinlPnOG4ycEvekb+VNCiD4ftSfBkRImgYG4SBJ89A=;
 b=QQTLbPWbUb7O3JiW02wbAvyNgBXbHCeiqfp1+FNiETsMPY3l5xCUpUYA
 3oTfkRTOSJP+zdvNwjgdCEs/NyNV8oxDNSxghL3+XENHdgqeDZiUGet7I
 9PLfbcbCoS99TnIeJ730naW4+rw9xz6A+ICQR1PaiqvTkSR/IlBgSJ7ks
 2vHImVa0MCNzeN4IxIR13SN7oegzBxJETyhQCsbkd5EPBGIaF5nUzkCdE
 bA/bWC8Gh/ROtLYonwl9YZn3RUMKobRLqtUPf62+gj2fLZ/r7+haIoV4U
 JsdkKHrorEdP5p/Wqpppbir16iCuHAvpoTCQ4LewdNvQeFHxg5eoQN5dp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3114375"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3114375"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 01:28:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5984513"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 01:28:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 01:28:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 01:28:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 01:28:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 01:28:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fad7CuDWh8eKE2sk8TyOVuoOG8Q1HFcDBEyqCU6Xq/5K3VJm/LQH6S42K8MSeOW4S8BwVPn88OGjjD+O2JEUs5+BdasQz3DFXvvTc6jC5oe4MPXO1qgeNN0UDjUc2YAKgooHFNbWz3BI+5HdSqpnFOOn6Pe0mkxA+QIJBcyyoHvBANknAEbrH0K4SEvk4vxSwCJwCt1OSb2WRpqHbpEnt39T/DTsEobjafrrEgzaxEpzbTtBqHFdDMyxOj7NPa0VhcPcOxCoFYGIZ14yuzb/J5QEN4jq8UmaqxBLjMDkBp801+dVggrD2znvpVOWHTEXsNtjYS55+BVcV3kun+aZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=secqjfu2OrrbMro8VQEQcpYUs7Ov9BYRIULOqVKda4I=;
 b=PPgpSr5JpMzeu50Vr60HNDjf/WwbeJ+hOPGD155qAw/kbxV+Dz6jc2vyyddN8Q/mU/L3MVGAWcwEGEA67UMrTUftxC2rbbAZZkMa8aAhEUyynTE1dWqmxgzB0RVnmWDgVJZv9SxSph2OrLybYcKqurbihv9EcCopV7gaWyJdby2IIv23eZnPy2yYUFD71J7NRaddadjZSLfnX2zpVVAylXozkyberO9vchADrXRH8qgiaL7wYVb0jGVNcugtTR0oN14WtC28zC+LKeAZKVDqwgqUhfAf6NW6+DNbp1zlY3QPGg1A0Yh0YSutNqKrONRxMAOAz0ma2FwkSF+dCivJFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5754.namprd11.prod.outlook.com (2603:10b6:610:ec::21)
 by MN2PR11MB4534.namprd11.prod.outlook.com (2603:10b6:208:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 09:28:25 +0000
Received: from CH0PR11MB5754.namprd11.prod.outlook.com
 ([fe80::138b:cb77:d4ae:34e6]) by CH0PR11MB5754.namprd11.prod.outlook.com
 ([fe80::138b:cb77:d4ae:34e6%7]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 09:28:25 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume.
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume.
Thread-Index: AQHaZiTP4liE+JtmvE+HiDAebW+UvLEXjxGAgAAZLFA=
Date: Fri, 23 Feb 2024 09:28:24 +0000
Message-ID: <CH0PR11MB57543D5AF664175074799AB2D0552@CH0PR11MB5754.namprd11.prod.outlook.com>
References: <20240223065136.19900-1-sai.gowtham.ch@intel.com>
 <CH3PR11MB84347F7CED524B4D9C7219ED8D552@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB84347F7CED524B4D9C7219ED8D552@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5754:EE_|MN2PR11MB4534:EE_
x-ms-office365-filtering-correlation-id: 6fa37e7d-52e1-401b-42d7-08dc3451c914
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U3UR/bMJjR4/aoMJVnBhyMUVMYS8QZ+K9KNM6udPELedLiia3AyOe+EH5Ee1sD847alUgySO+Iq+EvDIHIHv5prA1J9z2KUZ3KqbITIuSFi90+BbXdFCD5h4+RIJBanvPD0aHzXVmqWUrDgOM3+au5BWpo3XEgvIHKq5k2BX3kFpEu8w1s+32YNf2J6Uum9oO/mrrfNyUlC3rntfR3108vwwCLlfRV+QfBtQR8rBerN9yGJgZ/2LDuDOntx1udMSE+AO6kZWGvxGKszNytQUBuVTD7DwCDD8mB+NfD6NOD6SwOTmr3+AHrxjABeCTVzg9yDcGCOBwh8uMAHr4i4RmRafR4mCWHmx8J+gnJ5NH4nwJMokoR1YHuLKOleAC+AplakwtVQfVzorBpP9sjFUYtdwFjUx3yoB6rYsBJDnjWC0mX186Nh9tT0fLDR9CRmH9PTlVOzD5iqZlI9HAypf+zBJgllzkM+GrKJW9qXLDNuLMa9HlzAaxiFyNEdqPJCngtqiEBAqlp6xVi2GtK8DjydsRpMY5023CSPT17MUSiCRZRr0YYXXT3YzO85sx5x8f2NakQ++XiQPFLgJuiToqDRvlmQkDperBzFAgeUvkug4MWMMfSFdrW73SprXZt5G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5754.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UNSr1pQo5NnI+fnckw5qfBKpbWyXQNQutwBS39M7F7OLTPwJXHiItdj697nC?=
 =?us-ascii?Q?BGIIVUyJK66UV4dZiL9AMoK3aeu2hHfP41supFAaOB1XyBXgvfJBJ9TC28ip?=
 =?us-ascii?Q?Yp9y+ARWL9pGK5S5S3iQ/nZOX/CZ810oXOWilAAx2KUAlIjJl5UQkkm/1+5q?=
 =?us-ascii?Q?ek2qz4ItGZMg7GTST61Vzd/J9MESNX9oGovSjCG1FoGeOrdJmeFD/FQRQNZe?=
 =?us-ascii?Q?doPyYrENIk0X7xvhC4PYwvSNG/xJoAPtoRpLIqOTt2UEDUOftLZYECctqUP6?=
 =?us-ascii?Q?OkdfWMOwcZCHhsUbjTmXW3/v0f5y8CpKT4ZjpQLPyeKRLm+FveEcOwoqbnQH?=
 =?us-ascii?Q?iIMgZaF5+0wJ/rxI8ybA9zMifEbUdGZF5gugmDKLdH+pqNC1h2pVw4TGNlI7?=
 =?us-ascii?Q?Q2GrF323XUeS0RHVKxQ3arSgTDSAQ+In8xAM2xWi3R4V/GCwahhupevj77hf?=
 =?us-ascii?Q?kjz9Iv6mLLk/z+ADopCOqzCX8XD19b8DUqTI0RiVEz+DL26Su2xJAtKbBGyt?=
 =?us-ascii?Q?uVbFawYCElkfgGMt8ISGjb9EQu1KUF9Agwlfjjv5q/fFsxb11I4C1gdBlxRv?=
 =?us-ascii?Q?1JYzMEQkZuY3BublqDmVrOQ5SIecEsT07E4W0VB1KT0QnikukGx1UCxEak5q?=
 =?us-ascii?Q?0FQPngLPgTFMC5Dhl38yB6s3w/ysdiXOd5HullMKYZ9sr3mpRHHO55tkTt5i?=
 =?us-ascii?Q?j9qIhSZgivvdJpmKmQgJK/oWYEgQGcLWSwgb8TGotGRVxtSy41PxaIYeQLkX?=
 =?us-ascii?Q?JcLeTVT31bXQqDivYB1ur6qPun263V3/wSrcyeeg9ZS1P6I4QtUJZWda6OEQ?=
 =?us-ascii?Q?I4CpTQuhwwWC18aSn1pWcF+HwHY+BaJ9bL4wx+wrkXQAnkh38NKqAUIfobd5?=
 =?us-ascii?Q?Ul29zj2gHkpd+0VvCghTE1e7y7gADL+FHMc5LI0G9VjCa6DPIjxEHZz2dCDI?=
 =?us-ascii?Q?XFq2Weu6ItupuGnZS3lDRs7mvuE6S6rtqXxIoBnDa0vqHC37LNLEvOXaGjQU?=
 =?us-ascii?Q?ty3htYnSPhXwKq0baY4y5wdoXN1X3anr2t1/kki7ISYp/OLOW3ldgqwmV9e3?=
 =?us-ascii?Q?aSlfbHlgkJpLR7RQvlzOIDS2nD75P0Fj+2bNqtkyOilI6upbn2CRn9glr0uR?=
 =?us-ascii?Q?WL/ns4e44EuQgXhgtubpguKqeohIF+XpljW0WRLubXz1Sodr/h+sf5TUa5wc?=
 =?us-ascii?Q?uouK3FwF1WDg+KQgYehDBgjpAHiDiGRDSQTPPWIVw0y+mX+J6W+i/H3NX15m?=
 =?us-ascii?Q?XoyrcCR6JOumYJI2ZRsCNNeTkyG4E3wQYvJxz6wNm7jdwUQxczAFQkURvu6N?=
 =?us-ascii?Q?+GWd5zBxSu8i6L/+TC9F1zB/SZ6bp/IliDpRMiMr7MoPxhvB/GomIvQLiVt5?=
 =?us-ascii?Q?8DzZaq+nMeuw3gZpKHt4rqwRXdkAjpI8iXxHrOkkc9xAJ1Dc0HZweOVN7Jja?=
 =?us-ascii?Q?/SyahhkuL2Kjq/++yG0husNHIFVep/syAs5y0R17smOlDavqZKjZrFlwj1X6?=
 =?us-ascii?Q?Lpx7vqqX6Z7qWbJA38/NfZqIEqsBBfADuWXGSaq9y1/3oPQyOlHg2IM/Kkg+?=
 =?us-ascii?Q?CHh7zDH4kcFTsykatOCsY476RaHA0ur/+js2YdAq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5754.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa37e7d-52e1-401b-42d7-08dc3451c914
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 09:28:25.0031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RqLI7RNdjxMkCr+Lh9j1kvN7Vt+q4kTV/bFr+2PLAxfgH5mT5YVODmEXvan75j5Y3e82S4pSr6/1JegICZEUcC+43yTptDEilOUbQIkFooQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4534
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
>From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
>Sent: Friday, February 23, 2024 1:26 PM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; igt-dev@lists.freedesktop.=
org;
>Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Subject: RE: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind fun=
ctionality
>with suspend and resume.
>
>
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> sai.gowtham.ch@intel.com
>> Sent: Friday, February 23, 2024 12:22 PM
>> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
>> <sai.gowtham.ch@intel.com>
>> Subject: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind
>> functionality with suspend and resume.
>>
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Test validates vm bind functionality, by suspend and resuming the
>> device before and after binding VM to a VA.
>>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_pm.c | 92
>> +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
>> a0045da0b..f9d2ce421 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -550,9 +550,96 @@ static void test_mmap(device_t device, uint32_t
>> placement, uint32_t flags)
>>  	close(fw_handle);
>>  }
>>
>> +/**
>> + * SUBTEST: vm-bind
>> + * Description: Validate vm bind functionality with suspend and
>> +resume
>> + * Functionality: pm
>> + * Run type: FULL
>> + */
>> +static void vm_bind(device_t device, struct
>> +drm_xe_engine_class_instance *eci) {
>> +	struct drm_xe_sync sync =3D {
>> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
>> +	};
>> +	struct drm_xe_exec exec =3D {
>> +		.num_batch_buffer =3D 1,
>> +		.num_syncs =3D 1,
>> +		.syncs =3D to_user_pointer(&sync),
>> +	};
>> +	struct data {
>> +		uint32_t batch[16];
>> +		uint32_t data;
>> +		uint64_t addr;
>> +	} *data;
>> +	uint32_t vm;
>> +	uint32_t exec_queue;
>> +	uint32_t bind_engine;
>> +	uint32_t syncobj;
>> +	size_t bo_size;
>> +	int value =3D 0x123456;
>> +	uint64_t addr =3D 0x100000;
>> +	uint32_t bo =3D 0;
>> +	int b =3D 0;
>> +	uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
>> +	uint64_t batch_addr =3D addr + batch_offset;
>> +	uint64_t sdi_offset =3D (char *)&(data->data) - (char *)data;
>> +	uint64_t sdi_addr =3D addr + sdi_offset;
>> +
>> +	syncobj =3D syncobj_create(device.fd_xe, 0);
>> +	sync.handle =3D syncobj;
>> +
>> +	vm =3D xe_vm_create(device.fd_xe, 0, 0);
>> +	bo_size =3D sizeof(*data);
>> +	bo_size =3D xe_bb_size(device.fd_xe, bo_size);
>> +
>> +	bo =3D xe_bo_create(device.fd_xe, vm, bo_size,
>> +			  vram_if_possible(device.fd_xe, eci->gt_id),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	exec_queue =3D xe_exec_queue_create(device.fd_xe, vm, eci, 0);
>> +	bind_engine =3D xe_bind_exec_queue_create(device.fd_xe, vm, 0);
>> +	xe_vm_bind_async(device.fd_xe, vm, bind_engine, bo, 0, addr,
>> bo_size, &sync, 1);
>> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> SUSPEND_TEST_NONE);
>> +	data =3D xe_bo_map(device.fd_xe, bo, bo_size);
>> +
>> +	b =3D 0;
>> +	data->batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
>> +	data->batch[b++] =3D sdi_addr;
>> +	data->batch[b++] =3D sdi_addr >> 32;
>> +	data->batch[b++] =3D value;
>> +	data->batch[b++] =3D MI_BATCH_BUFFER_END;
>> +	igt_assert(b <=3D ARRAY_SIZE(data->batch));
>> +
>> +	exec.exec_queue_id =3D exec_queue;
>> +	exec.address =3D batch_addr;
>> +	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
>> +	xe_exec(device.fd_xe, &exec);
>> +
>> +	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0,
>> NULL));
>> +	igt_assert_eq(data->data, value);
>> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> SUSPEND_TEST_NONE);
>> +
>> +	exec.exec_queue_id =3D exec_queue;
>> +	exec.address =3D batch_addr;
>> +	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
>Are the assignments gone after suspending?
>If not, reassignment would be a duplication. Can you please check it.
Will check that, thanks for bring this point.=20
>In the commit you mentioned "by suspend and resuming the device
>> before and after binding VM to a VA".
>Are you doing that over here, are you binding before suspending and resume=
 and
>then rebinding it again? Can you look into it.
Idle plan is to bind once and do multiple suspend and resume and check if t=
he vm bind is still intact, I'll correct the commit message.
-----
Gowtham
>-- Priyanka
>
>> +	xe_exec(device.fd_xe, &exec);
>> +
>> +	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0,
>> NULL));
>> +	igt_assert_eq(data->data, value);
>> +
>> +	syncobj_destroy(device.fd_xe, syncobj);
>> +	munmap(data, bo_size);
>> +	gem_close(device.fd_xe, bo);
>> +
>> +	xe_exec_queue_destroy(device.fd_xe, exec_queue);
>> +	xe_vm_destroy(device.fd_xe, vm);
>> +}
>> +
>>  igt_main
>>  {
>>  	struct drm_xe_engine_class_instance *hwe;
>> +	struct drm_xe_engine *engine;
>>  	device_t device;
>>  	uint32_t d3cold_allowed;
>>  	int sysfs_fd;
>> @@ -693,6 +780,11 @@ igt_main
>>  		}
>>  	}
>>
>> +	igt_subtest("vm-bind") {
>> +		engine =3D xe_engine(device.fd_xe, 1);
>> +		vm_bind(device, &engine->instance);
>> +	}
>> +
>>  	igt_fixture {
>>  		close(sysfs_fd);
>>  		igt_pm_set_d3cold_allowed(device.pci_slot_name,
>> d3cold_allowed);
>> --
>> 2.39.1

