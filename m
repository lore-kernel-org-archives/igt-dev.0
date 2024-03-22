Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7B2C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 17:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF9611262F;
	Fri, 22 Mar 2024 17:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esVP3Y3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B6911262F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711127132; x=1742663132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rFvDDMPny5d3ypq0z9eoEB0gcoh4rwERbZDaradBdY8=;
 b=esVP3Y3WFaC4gg0R+4an4Zlj+NMTORO86MEhcRbXHxhIh6Uzi2ARponn
 uRaF3PtQDB06n+/MXeBer6ZQvh2hocLVw8tjkend9pXSfavPKpJ/uT6lF
 Ueu4n0EdwedREf8x85NxXffrsqS9n77uAuRnTPuDciMxY2xQ+GevgpdWY
 AUMu9W+W0LvR70ljZbHzp0LwHbP21QaG8BwI/luYwp94rie8pdJInkpTX
 xpAicM06QdzhEYql+A+xOLov361XFrjsHbgucL6aQMbHR+2z23laaZwOW
 CpvWHH1wVO4zvB5ddBrWW05Nx0aPr/M9TchohO+JOh6aui/Uy4kVQ3sLj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31625065"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="31625065"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15007620"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 10:05:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:05:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 10:05:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:05:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c77u3GEAdv5GFcKpGZxWZ+W50RT46cKtkBvUGcI7bT6OM514rkPJViaK+NEK9chNhNQ1yxKqnWKBabxiO1ZE6L/reTIXjCgc36goXCO3GJV9Vtp4DAU1VgR6ISqvpw9+bAD1BU4Qv3kGf3a/iVYD/LPW3HmcA2495Y9DJd5xvEN6diqaWblFOYv651lfBcCtxPpskGVS2GLHFhZT3hUE+CnynHKOMNiNexXou5whQ75rcGzBAGpWVehpiKk/JaKfIeMMFNJs1ZFByb6NQQILXS6rbx+2ml4RwkmGOvRmuup6nmv2fzjd/GtBGqMeV4iWK47Lsp8TtJWadai4NmHVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ENlsAhYuIFVsdRmt5MKCr7/kG5gTHbx+D2kduN0NsY=;
 b=D3bto90Pqty98aibXZgzgGc8Epji0ucgv5Bnf28JIuMcrZu2WUn/Q+HUIGlfkEu+oKQkINHfdcmgTa1D3khbLdoz8LhgHIGAi9U5SYth8Oco7/icAjLolvZAHSAO+EfNFpOgoHNW7lrrkapJUBgrdvgj44M9+MCibB5fo998ZEcf/1cxOyaWTH9EwB0wSZqrYpzDeC8noRC5iuMHhQ4xEPI5wtqMea7va7At86Ea0hEVSxC2xqxtU8w6y1U/XLQrcuX2XYHiIyQBXss60gJq3OBjbQFQuzVIqrkgGrAmGSxz2iJTFE3ZVXUNhgEr/JL3BnFzx0y7T75Pg5al/tr+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by CY8PR11MB6892.namprd11.prod.outlook.com (2603:10b6:930:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 17:05:29 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:05:29 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_pm: Test to validate vm unbind
 all flag with suspend and resume
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_pm: Test to validate vm unbind
 all flag with suspend and resume
Thread-Index: AQHadpaPV8XoaeGa/0iuCTb9JtE12bFCtAeAgAFTm/A=
Date: Fri, 22 Mar 2024 17:05:29 +0000
Message-ID: <BL3PR11MB574732F8FC66131CACCCA948D0312@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240315050536.21319-1-sai.gowtham.ch@intel.com>
 <20240315050536.21319-3-sai.gowtham.ch@intel.com>
 <ZfycO5S5R5CS1fgz@intel.com>
In-Reply-To: <ZfycO5S5R5CS1fgz@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|CY8PR11MB6892:EE_
x-ms-office365-filtering-correlation-id: 2c935500-1350-4fae-7e81-08dc4a9246b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yFAS2X+i5NySgo25O77M+rk/csJO2dvbMW9x/fTx86Sp0Diis6Hw/5FoMncyiKQ1fxhjBCD7/3vLgrOp7C+LxA5CNWYferS+qIBDLRsjm00i9jenUsjLr0SFoH7+0KbjRvN90zp6sckyhjp0WkliSbU5gwllNjnYJWIk+nZz3Ux+ZP0Bho9REc8qXrRleM9gSBuPrQ96cQS3A4U71l74Y+eRR9ULXd/WgJcR+EUs8kVmR3NUJK+mDJCpZX1BdJt8FW/shgP8Vu6qbFKN4au3HcuCJeIJ/JRe7guBKP6NgfidDKPqI62wqWv4KtrF9fGXU+sIFmD+E4A5RORMs4vU0rnaRB7VbJGJxD4TPoCG0r2UpmiOfc2n/o4a6q2s1wuS/SrhkZFxZJXAYl7GbObN9OyzcuWXoy0OGvL3UKzYbRWkTJNN1AG2ASxFf86cC+e+bxxqTEJG4VrVYPSMPSwS9aidEk7reLvB8W9XpNL6RG49/8oFm9q2p/+q2KxE1NIr30mVcxP65ZC6r20z1E1RsR29fYfHgEV7OBRNHqbpynBn0rlqqHaqLAprMMcx7OjiBtxsdjpxinoqt5y8K4u1d1C8ImHUBkAwwd6YAbZFig6LV1ASFGrYRgze+n3GGkpDRIEK2LdxeATuA2WGMsxeQ0i6Z/TnMeXou3s1deLYi3Z8a+0ELOxfNXjyi3zVNjvHBxs3JWaGDOvQSLN57Jy/1WPcqK9Gla/+47+PiVc6pjI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lvG6IoXMmbJE9GdqeCcZnbOXWLWhfbsWmXeL+G2bvfXUfmJjbbusKTBxilws?=
 =?us-ascii?Q?pC7DePr+bZSjapOhL3bFYI6H+8vihItlYPgFWEVqL9ScWJGLl53DK3CT6tEG?=
 =?us-ascii?Q?6Bl1dq/PZl8LKikCf9imvJptSGP4cCegP2BGdnOZxktF3R3XxdtFXJYDuc8b?=
 =?us-ascii?Q?c5byG3BcMDGrbg8XxPn4RwqdOJEQIbHPUXSCXht+FAJyJ7vOa0F1u+ArJ22I?=
 =?us-ascii?Q?x07nX+H8yeOluk2q3BMf4V2sCNFqCTWPKcywz9wR/SXiexWyGltmydCaweip?=
 =?us-ascii?Q?C7YrE5UCYQHrlY/nWtJIKyOuyC6vNTHCFdCUYqJgp95/TBwxkUSh9OhKLhil?=
 =?us-ascii?Q?UznqFgiVwsPYZlWbkWQe7pWpKbry3fip3wFhBhrHam5hq0sFPAjB9tS9KjNN?=
 =?us-ascii?Q?/TSDRD+AoT/jyd1CoY8YepvbIfN+KnRjcAJKzbZd8WMyav/FsDK4AhVfV10Q?=
 =?us-ascii?Q?Jzu+16QQPr/Tyua0pjVZFYmb/cEIqvtMDOlHGMaZa4+Oj3fjcZGS+QtTzkvA?=
 =?us-ascii?Q?JD1/hKZdEYByiPgXuI0HYuoqGb8slgQFZd8TLU9BX+ePlhTen4fqlNmlwBBm?=
 =?us-ascii?Q?8+0BNMGjZYI0rLYXUgI/w4yeX3WeBCncF9IOX/A/SgLl1rmndWSxDXBnHDwE?=
 =?us-ascii?Q?IkZYH63la+J0LJAaSkOkrEDAsZuiXLTjo0hmzGavOCR0eTQ+fMUsxGWa8ejI?=
 =?us-ascii?Q?oU7uMvQjyZcoUNCdqUj3EFnuVsnf7aEnO7TCvZqhbdeiZD6qaut1qRZlebEo?=
 =?us-ascii?Q?EsZLH2/hYkqqwpveUlHv0TwgskZDG4+x5zmVPS9D+61gjX2ccsKC4Ohd5WdD?=
 =?us-ascii?Q?7cY11sEDKTygEhTzv/DIjF01eBjEzN7ma+9Z6/F3XnpFhl7rnkNapiaRap3r?=
 =?us-ascii?Q?HdjuRwhoBzdX08pButob9zGQASi5MT+I8exsQJdnJEu19s3tMvkILieg3yAu?=
 =?us-ascii?Q?QGC+yChQD0VUHzAREEa9m3vqwRU96jBHtu2Gk4CGDE8bmIAiQ9NQ3VCzUbv9?=
 =?us-ascii?Q?O/3YT5/dPGNjinBu2VQalO14Km47zGA+plFsXB1wfdyedxmJ5JUMgrVtlMZA?=
 =?us-ascii?Q?Nl1eFT/qI6T4z1DzKCav6lvhrmo1UC8txRe/Qj8UTOwFyTWGZJcIX3CFLUfm?=
 =?us-ascii?Q?/eTe8eZFe3Umx7JIexEJoLv21eD57NFukeKQTq48NxszjhhTE2L67CYJZJ6A?=
 =?us-ascii?Q?HoYt//6fLZ6/P8Pj3LGVeDZWzcybLAkSlYlHbGPrcSf3/Dx+n1/rIXFtQtji?=
 =?us-ascii?Q?6CVzQ3uQfgjb3AmQu5pIoEpA01ChToDHH73q+I+YmXcNCXltzOs2mc3PWnPI?=
 =?us-ascii?Q?XHb766Oqh9KHm3GqxsVDN7oOO9ZS0j5/ujkzYJSfJ0giGZwuA3qvWriaFyUC?=
 =?us-ascii?Q?amEtcTQWPYLU4kIJgnO8B7Vvzb0CqAp2OXToI5SgoKgBn5fjxclKuAR6A2VV?=
 =?us-ascii?Q?KOKsGVMTzm6OwQFP//ce2OK3afEiTIu3PayvhktrrmR6iMz8WBOQiVAHMZs+?=
 =?us-ascii?Q?tjKwqobRX44ZQywh1wrS2GE7d2f/Gqg3UEooYdO3BfcOpaFyBiMwfR1lIX6y?=
 =?us-ascii?Q?0I0p5hUnwbv7SNuNcOC1E1tWEUMGZik5/lK996DV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c935500-1350-4fae-7e81-08dc4a9246b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 17:05:29.1058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ORAOjruihrFwrJHU/DZodMAdc/QfJJtvjDEYOEC2Er34rF98KCtd65K96DQPd44fTVqMJft0qPQInxLNKIQUufV6t5peq9tS0AY6sPoFkOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6892
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
>Sent: Friday, March 22, 2024 2:15 AM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Cc: igt-dev@lists.freedesktop.org
>Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pm: Test to validate vm unbi=
nd all flag
>with suspend and resume
>
>On Fri, Mar 15, 2024 at 10:35:36AM +0530, sai.gowtham.ch@intel.com wrote:
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Test to validate vm unbind all operation with suspend and resume.
>
>it looks to me that this is more a multiple vm_unbind then what stated her=
e since it
>looks like this case was already covered by test_exec
The intension behind this test to test VM-UNBIND_ALL operation, However lik=
e you mentioned the=20
functionality of this flag is to unbind all the vm-binds at once.
>
>>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_pm.c | 37 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
>> ac402e757..f46120662 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -605,6 +605,40 @@ static void test_mmap(device_t device, uint32_t
>placement, uint32_t flags)
>>  	close(fw_handle);
>>  }
>>
>> +/**
>> + * SUBTEST: unbind-all
>> + * Description: Validate vm unbind functionality with suspend and
>> +resume
>> + *
>> + * Functionality: pm - s3
>
>why only s3? why not rpm?
>
>> + * Run type: FULL
>> + */
>> +static void unbind_all(device_t device, int n_vmas)
>
>why not simply making n_vmas a test_exec param?	so you can have
>more combinations ready already?
Will make this change in my new patch series.=20
>
>> +{
>> +	uint32_t bo, bo_size =3D xe_get_default_alignment(device.fd_xe);
>> +	uint64_t addr =3D 0x1a0000;
>> +	uint32_t vm;
>> +	int i;
>> +
>> +	struct drm_xe_sync sync[1] =3D {
>> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
>DRM_XE_SYNC_FLAG_SIGNAL, },
>> +	};
>> +
>> +	vm =3D xe_vm_create(device.fd_xe, 0, 0);
>> +	bo =3D xe_bo_create(device.fd_xe, vm, bo_size,
>> +vram_if_possible(device.fd_xe, 0), 0);
>> +
>> +	for (i =3D 0; i < n_vmas; ++i)
>> +		xe_vm_bind_async(device.fd_xe, vm, 0, bo, 0, addr + i * bo_size,
>bo_size, NULL, 0);
>> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>SUSPEND_TEST_NONE);
>> +	sync[0].handle =3D syncobj_create(device.fd_xe, 0);
>> +	xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
>> +
>> +	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0=
,
>NULL));
>> +	syncobj_destroy(device.fd_xe, sync[0].handle);
>> +
>> +	gem_close(device.fd_xe, bo);
>> +	xe_vm_destroy(device.fd_xe, vm);
>> +}
>> +
>>  igt_main
>>  {
>>  	struct drm_xe_engine_class_instance *hwe; @@ -768,6 +802,9 @@
>> igt_main
>>  		}
>>  	}
>>
>> +	igt_subtest("unbind-all")
>> +		unbind_all(device, 2);
>> +
>>  	igt_fixture {
>>  		close(sysfs_fd);
>>  		igt_pm_set_d3cold_allowed(device.pci_slot_name,
>d3cold_allowed);
>> --
>> 2.39.1
>>
