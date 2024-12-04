Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA2BE7716F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 22:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F4B10ED69;
	Wed,  4 Dec 2024 22:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2Yh3fxt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39F10E5AE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733350828; x=1764886828;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j2TRsNVLhCQ+QyB7/ZYnr9EvbdMW43Y4RgHcFmDMTmM=;
 b=K2Yh3fxtKRsGaYy13Wl50QpVzTi8fwcnhyVUFDuI5FeJPyf6XctPfW0B
 9c84Gquc67kNDXq2VzIU+fdFfSaKm3+W1D/tP9/ietLCPR+KG/vw2mful
 CyGbcQmfgHNCd0mGib/choxu5S/wXXR4iv6iMZiuG8b5oVhoYCDVUQjoc
 eb8zB032RDfsBwrsk7zcOLpaVxRRPGu88DrJvdMbFBgbeCmQ/RBG5K2/M
 RQY/PVul7SNrmJXeRx17QiIovtovKW8lOX9Pbw0doT5oRi8NGAR/aq2EC
 SGYXTIioU0EpAyzacelWdsZtSCoYZ9U/+uzdgGKkmMrS4V9ZQm3aysrN3 w==;
X-CSE-ConnectionGUID: 5tMTmeJ2Sdyxm1I1ZNHRhQ==
X-CSE-MsgGUID: 2RvDOU5lQnib2VTHeLCGlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45017992"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="45017992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 14:20:27 -0800
X-CSE-ConnectionGUID: 2HAQtOBoRSKIzmnYiZ0H8g==
X-CSE-MsgGUID: ylBpSdwCToKooFHKeHEjJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="93776123"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 14:20:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 14:20:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 14:20:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 14:20:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uarl9kgu36oIPh0b79L2C6DPC59jy5/8rBas2ikzetsnKdXJQzg67i0u7lgZvNs15xbof9fKoegp3T7Qohv/4JM2Fn9uXU+UrOb8Rs94rFMbVGtPs2b1+/V0BpInRlVthq7imx67xQmHK8OE/UmQ2NNFJCpZzowGVlziwHrIpy1FrW9yfsuy1RrATzmxjSY/+IFsyzMCJI5G5IyyXI/2X/zTYXr37XzJ7t0MMhuL6TZaM+VVcDNYFaam+BgSp3YMT46NrIF2jPtb5gfs7JgPhncN+HZcDCZlQvc1o4J9hgWO5FK3o5XTSyT8b5QbxWFQN6RzymIIHnvFvPTm8jNcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2TRsNVLhCQ+QyB7/ZYnr9EvbdMW43Y4RgHcFmDMTmM=;
 b=AUaB26Yyno780h/uKFbVXpLIT9oxBcvCNN7A+L0NfG4y7G1v3EPgkUv8AXy8YtFKjzTZ0mu1xjCkHn8Zha8/tm+Gku3Grvv7yxsquO3hirQLdxAsCcQ6Wio/6tJHNQ4lwUdEGTUTZ0ytaiTUEVeUWTyr3N5UeU2LSa6fdz2htk+VLt4z5dUXypRNtt2a9lVPgLOmXh8F50cMfFTDkdQXIe4DM/QZuG2G95qF1kNvqhgLIL55U7oF8iJvZSCvc7K8mEGVoMVghHrBzacM4WdC8jYqOykmXqoTDSLoGilkIT1LnuzwbOp+y59HH4j3KKMe803OL60/+9zd6Xa9KU1LLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7840.namprd11.prod.outlook.com (2603:10b6:208:403::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 22:20:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 22:20:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [v9, 4/4] tests/intel/xe_sysfs_scheduler: Assert sysfs params are
 restored
Thread-Topic: [v9, 4/4] tests/intel/xe_sysfs_scheduler: Assert sysfs params are
 restored
Thread-Index: AQHbRnmJn79yJiacNUOQmtgSNaqoT7LWp+3w
Date: Wed, 4 Dec 2024 22:20:17 +0000
Message-ID: <CH0PR11MB54446B241E5F62077D6F8382E5372@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241203223213.81798-5-jonathan.cavitt@intel.com>
 <Z1Cd7leuoeUuTVpx@kamilkon-DESK1>
In-Reply-To: <Z1Cd7leuoeUuTVpx@kamilkon-DESK1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7840:EE_
x-ms-office365-filtering-correlation-id: 91ecd4b9-ec47-4c27-ac17-08dd14b1d527
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K1ZNSnUzVVoyRWZXekdoMG5jNHErb2s5V2hNQnpVMVl4dFROWll5c09WRVRh?=
 =?utf-8?B?RWlIczduZ05PNmJNMDlEWXdvZEtvTHdEdExQdnNSQWFaVUs2QU53VENRTklF?=
 =?utf-8?B?bk1qOUtHdUtoQnZRUWtHQ1NZWkQyYmticW5yL3JreUt0ZklNVzNsak8zREVC?=
 =?utf-8?B?U2N4SW5xWXJ5bEFQRWJUajE1N1RsNHBoUm5DaEQzWnRJOXlNSmdHOGhPdHFo?=
 =?utf-8?B?QUYwdmhhejZIcVZidDhSeS9sRFRCV1RUZzJ0OEc2TitGZWlTTnlKa1lxM3hJ?=
 =?utf-8?B?NVYrSHlBZENtY2lsaWV3UmR3UGpmRk4vODFMY1R3VkdQRUw4M2s1ME9ia0kr?=
 =?utf-8?B?MSttc0s3bGUvSXdaS1FRWUtoQjBFMGxiclhXU3ozV2NaTDFCU2ZJUkJvb2lW?=
 =?utf-8?B?WnpMQW5qVG84cjFZR0dCYlFSQzkxNmZ2ZktKY3l3d3k4NmI2N0dGUjJXK1dJ?=
 =?utf-8?B?djQ2bUpHenBocytzQUp6MXFSWTBkWFVDNUxHcjFnb2hEOEZhckRWLzgwY1l1?=
 =?utf-8?B?dVc4dm5tb0xtZTZwR0t4NEJ6Zk1ZelBJTno5bDJ5UXFHR0ZWWUdMb2lPdXF3?=
 =?utf-8?B?ZDdLSGJjYzFlc2VBQjRseHhsYTJ1TVZCd0RBakxJcDFpelIxVmZlNXRWUzdl?=
 =?utf-8?B?a0tjTk5VYTZzUjJGQjdINVI3MHd4RUdyVU5GYVhFMDVCWTJZMzAreURQQktE?=
 =?utf-8?B?WjlXaStScXJKUm9NdDJKUkpkWEZMQ0NFQU16NWF5bXRqVE1QdklnclFuVElm?=
 =?utf-8?B?azFGbmoyWnF5RloyRjZOZ1ZaemF3WmJBbUNrK2sySTRYSno5Nk1zMGcwWTBI?=
 =?utf-8?B?MUpyTTkzMkRLaU5taSswbjloMEJ0NTFaUGdiaG1LeE9kQld1Z3pJemlHcXlP?=
 =?utf-8?B?RnRNTUEzNUEvWDg5YmtBYnJaTEZIRjNWV0U2RU1EaW1NbndUMHZMZXlRWEk4?=
 =?utf-8?B?N0kwRmcyaUxjSlprZnpwYnc0b1FWcTdodjlMNTZNZkNoL1R5WmpBQnB4enJx?=
 =?utf-8?B?ekJnOUM2UkpiSXdkbmYrSUE5RG5mUTZReXpPSGpPV1p6NHFMTC84RTBOYlk5?=
 =?utf-8?B?KzQ3cWwwRnZQc0p3THljTHF0cTY3bURlZ2xQcVkzM0FzLzBmcWk1c045OUxp?=
 =?utf-8?B?a2hxN0dkamxlamVEYWlYYjErQldMQXMrdEJwY255WENFZlJUeENEUEZrb2hB?=
 =?utf-8?B?VTBNZWtVajhkakV5bXFEQkdaYVJGYXdQUVJEZXJVMDVCQmZ1TEk0cWJSaHRS?=
 =?utf-8?B?WEZnVWtxNFE2d3V5SkZqMXZ3VlV3dTA0VDNmeEVXbjMza1pIc3U1Q1ZBcFM1?=
 =?utf-8?B?SHlJczNkd0pBdDI0ZFpNeFVlbWJPZElnbDRFdXBub1Z6aUV1VDJqOWZjMFdJ?=
 =?utf-8?B?WE1TdUVoMjEwZHZucVpTM3FsWHQxVERrb3Bpa2RvVnM0d0k5YkdvYmplYmhh?=
 =?utf-8?B?bHBOcktBc0EwTGJ2ak13ZlFhNzkrMUhHMTRUNVJzczAxWXpsa3diMjQzNkFK?=
 =?utf-8?B?c3pxb0d0UzdIWWtKSHlaWE85eXVNTjhwVkh5Rjk5ajAwU2krRUVEY2cwTGx0?=
 =?utf-8?B?aWovUk1hcHFJdnljdkdGQlB5MmxFYWxpclBmRmNhdUFVazdPaFUycmhWQXd1?=
 =?utf-8?B?RVoyNHFQTUtwUDIxWm4vdWQ4YmorLzlzQ1RWVVR4WXdIcDVYbzdmNjQwRmc3?=
 =?utf-8?B?UlhjeDF4ei8zVExndXNOWWhLVWNPVnRjQU81Q1hQakliL0RmMDdBSzBhV3pE?=
 =?utf-8?B?RDBxN2hrWmUzL2dkQThJV0ZQalpKQk5uZWk5U2RWRHFWazZ5azNBd1Y4Rk9O?=
 =?utf-8?B?UXlWa3BxRk5sTjJhL2FwcjNKaWFGZzJzVXVJdW5KUmhLcnJkR2g1OCtCb3ha?=
 =?utf-8?B?Rk42QmpSb3F0VHRpdnFnWVJQS1VoZjNBN080ZUNENW90RkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?em1hZjZCSkUxc0F0T0JGTkNQVHRiYmtJV3lLUUh2dmJ4azNSNW9INGhTS00w?=
 =?utf-8?B?bitwRHdTall2ekhXZUF4MW9aVGI3NmRjNElRd29WMXREVHByNWtPV2JvWTQz?=
 =?utf-8?B?QUJFcStKSGFQOHZkZjNDZmNIYlVRajdTbGhETlFHSWdjOGJVQ1JLeHlRbHhM?=
 =?utf-8?B?VURTOGJzdFBhTEFlK2t2Wlg5WmZjbmd1eFVEM2hIWFQ0OGJ3S2tJOEhlZDE4?=
 =?utf-8?B?V3ovMFU1Nzd0TE0yWGJ0MFFwNThkeHo5dlNzeXlRWHR2NDVLVG1kTklVT3FJ?=
 =?utf-8?B?YlhSR21PaytBZ01xQnhOTGIwWmZuNUlVbDh6TU52dGNYU1h2Y0wvbURqZWIy?=
 =?utf-8?B?cjBkbEFTTTVWWjZMcmFMdFRSRTlxTVJidlk2eFVjTWdaYmlNdEd1M0JZZ3Vk?=
 =?utf-8?B?a1Z4bGQ0WkphUlRQVVVUVHpLUzF4VlJWNmJTVlJYOUFIVWZaWjN6alVzNjQ5?=
 =?utf-8?B?WG03N1lGV2NISWlDSzR4K2ZnTk4zQ0RoVlRTQXIrMEZDSDhKRDdpOFk0eDgv?=
 =?utf-8?B?SWhPbDN1UFhoNHk5TGdNU2RSUWZuak1iNS9uUU8xeVQ4VUF6MVRGNFl0ZkRJ?=
 =?utf-8?B?dFpkNnVTNjFvTUF2R1lmWmgxNlV4Z0loaGEwZFFyYiszTHg1aTdRWW1PbHBD?=
 =?utf-8?B?cFIrS2xXOHZHa1BPYW1wRENRNE1JcHh5VFpZUkU4emRFdHZEeWQySlU2OG5v?=
 =?utf-8?B?eUNQVzhISGJVTEVvNTRDU0JHQlJyVk95dWVmcXRIdE5iVTMyVEdHOUU4dUZR?=
 =?utf-8?B?UnhwejA5WTNsalF6bXZ0NXdrS2NScjgzRHMyYTBZaEJETEYzYlZLZ2FpaEhE?=
 =?utf-8?B?SHVZL0hSUWZqb3YrTGUrRmRUZFFHTno3MU1mK1FpVjFnUFZyb0RtNDEvVy9D?=
 =?utf-8?B?M1dqVGcxdlNCWjFzS1NnU3A1NnRTQTk5eFp2aXdVT2VPK3gyZHlnaWlJMDZp?=
 =?utf-8?B?a2pMd0kwZVJOamlhb0RHYmV1d1hvalVIM3dkcjVwNzVabFIvWEpOdXRienlI?=
 =?utf-8?B?MnFpU3FTQ1JaN0MxNXFnZ3doYWJVMDNLWHlkNmM5QjJUR2ZpQktJSWM5Nnly?=
 =?utf-8?B?d0tIMHhNVFBmMDM0Qnp4ZXNnbmtDcHErK2xXUGRJaWhGRWpRL3R4ZyttdFUz?=
 =?utf-8?B?MWVNMHNwbmJDMlpCWE15Y01YT3RnYW5CVmtGbDZZcFZRcUxsT2ZYZlRYTkRn?=
 =?utf-8?B?TEpSc2xvTGoyd01rK0JOTUVtRVNZRUx6QUlJcGpqK2hTZDNkaGpTbEYxS3JW?=
 =?utf-8?B?SC9hYkh0Q2NNanVxbWRENmFrbDFGWk4xZ1BFNGc4bERxcGRjcEQweTdEcGdQ?=
 =?utf-8?B?S2xkR2VYUlFCcUljZEgxSzM0OU04Smhkd2tjbUIxZWNWMHhUMjRGdWRlVnBh?=
 =?utf-8?B?a2ZPU3gwUXRIOTNZWWpWUjVsMlVCd3dzWFVXTXYwN1FFSWdzUC9RbEhNdjFX?=
 =?utf-8?B?ZlljNk9McUw1ZUVZN3VEamk3bC94TUhUaXdKdGxnSzN6S3NHVWZrb0NEZDVn?=
 =?utf-8?B?MEtXaDMrV2dDTGN5S0c2QnZ6UThTanZwNVNkS2oySWsyVk52UHR6T2FGNnZW?=
 =?utf-8?B?dCtvNmNUc0JoUDkrZ1V4ckN1c1ZLVHZTTE9EaWpYLzV6WTlzb0tOb3dtK29G?=
 =?utf-8?B?dmlDVXZvbWh0NEw1aTRhYkVxTW9mbUJhYUNKRWxvWUZLNFdSNGJzZkxqVkNY?=
 =?utf-8?B?V3V0eEtLaGljVVNrT0Z6QXVqMWYzQXVnK0dNOUthRCszVGNtQlRFbDh3djcy?=
 =?utf-8?B?OXBjclZGNXNXSzl0YlRpRzZOYnRyWnhXTjBUVW82UVNDSnBIQ2VtajBnVWwr?=
 =?utf-8?B?cEh5NWdtYnIrdmdobk1rTXF4QWM1eFVNaDJDUW11V21RL1oxME9lSm5LY0tv?=
 =?utf-8?B?c2tVNTY3SGZSVUFsN3NEcE9Wa2pNblE1SFBYbWZjUWR2MTlOOGwvd2hjNUlu?=
 =?utf-8?B?ZzhuNUg5Zkl6NnZQQjhNTmxkWFNwVVVlb005UzAydHV3Tm9rNFZ0a05uaWVG?=
 =?utf-8?B?bnptclc5QmZZOHI2Sjc5emVxZnRmK3MwVzIxQnNnSjY2Ky9henVGRTVmT0hl?=
 =?utf-8?B?eSs1WEZ0dGRGU3hDYVRuNWo0SjMxSFJGVlpxc1I0NUREcU9HN043NzRRd0JG?=
 =?utf-8?Q?p3Wt4K+AIWMHc0+g8v2uoAz3a?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ecd4b9-ec47-4c27-ac17-08dd14b1d527
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 22:20:17.3801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kuJTw/MejbhFWXNfK0dumdQB/VLSEn0H8gdQXUXILb1ETPG4eSHdbTTwuzKvswHPIqkZLBoOVZ0YDVHeDCpXHaDvpraki/Mx1AYLNktuv6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7840
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDQs
IDIwMjQgMTA6MjMgQU0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50
ZWwuY29tPg0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBHdXB0YSwgc2F1cmFi
aGcgPHNhdXJhYmhnLmd1cHRhQGludGVsLmNvbT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwu
Y29tPjsgQmVsZ2F1bWthciwgVmluYXkgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tPjsgVXBh
ZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW3Y5
LDQvNF0gdGVzdHMvaW50ZWwveGVfc3lzZnNfc2NoZWR1bGVyOiBBc3NlcnQgc3lzZnMgcGFyYW1z
IGFyZSByZXN0b3JlZA0KPiANCj4gT24gMjAyNC0xMi0wMyBhdCAyMjozMjoxMyArMDAwMCwgSm9u
YXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+IFRoZSB4ZV9zeXNmc19zY2hlZHVsZXIgdGVzdHMgbW9k
aWZ5IHZhcmlvdXMgc3lzZnMgcGFyYW1ldGVycy4gIEF0IHRoZQ0KPiA+IGVuZCBvZiB0aGUgdGVz
dCwgdGhlIHN5c2ZzIHBhcmFtZXRlcnMgYXJlIHJlc3RvcmVkLCBidXQgd2UgZG8gbm90DQo+ID4g
Y3VycmVudGx5IGFzc2VydCB0aGF0IHRoZSByZXN0b3JhdGlvbiBwcm9jZXNzIGNvbXBsZXRlcyBz
dWNjZXNzZnVsbHkuDQo+ID4gQXNzZXJ0IHRoZSByZXN0b3JhdGlvbiBpcyBzdWNjZXNzZnVsLg0K
PiA+IA0KPiA+IEFkZGl0aW9uYWxseSwgd2hlbiB0aGUgdGVzdHMgZmFpbCwgaXQgaXMgcG9zc2li
bGUgdGhhdCB0aGUgdmFyaW91cw0KPiA+IG1vZGlmaWVkIHN5c2ZzIHBhcmFtZXRlcnMgbWF5IGJl
IGxlZnQgaW4gbW9kaWZpZWQgc3RhdGVzLCB3aGljaCBjYW4NCj4gPiBjYXVzZSBmdXR1cmUgdGVz
dHMgdG8gYmVoYXZlIHVucHJlZGljdGFibHkuICBBdCB0aGUgZW5kIG9mIHRoZSB0ZXN0LA0KPiA+
IGF0dGVtcHQgdG8gcmVzdG9yZSBhbGwgbW9kaWZpZWQgc3lzZnMgcGFyYW1ldGVycyB0byB0aGVp
ciBvcmlnaW5hbA0KPiA+IHZhbHVlcywgYWJvcnRpbmcgYWxsIHRlc3RzIGlmIHRoaXMgaXMgdW5z
dWNjZXNzZnVsLg0KPiA+IA0KPiA+IHYyOg0KPiA+IC0gU3RvcmUgZW5naW5lIGxpc3RzIChLYW1p
bCkNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNh
dml0dEBpbnRlbC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogS2FtaWwgS29uaWVjem55IDxrYW1p
bC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXdz
ISAgSSBqdXN0IG5vdGljZWQgYSBzbWFsbCBmb3JtYXR0aW5nIGVycm9yIGluIHBhdGNoIDMgdGhh
dCBJJ2QNCmxpa2UgdG8gcmVwYWlyIGJlZm9yZSB0aGlzIGlzIHB1c2hlZCwgc28gZ2l2ZSBtZSBh
IG1vbWVudCB0byBmaXggdGhhdCBhbmQgc3VibWl0IHRoZSBmaW5hbA0KcmV2aXNpb24gd2l0aCB0
aG9zZSBSQnMgYXBwbGllZC4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiANCj4gK2NjIFRlamFzDQo+
IA0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC94ZV9zeXNmc19zY2hlZHVsZXIuYyB8IDg5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3OSBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwveGVfc3lzZnNfc2NoZWR1bGVyLmMgYi90ZXN0cy9pbnRlbC94ZV9zeXNmc19zY2hl
ZHVsZXIuYw0KPiA+IGluZGV4IDk0N2RiZGJjOWIuLjg5Yzg3YzJlZWQgMTAwNjQ0DQo+ID4gLS0t
IGEvdGVzdHMvaW50ZWwveGVfc3lzZnNfc2NoZWR1bGVyLmMNCj4gPiArKysgYi90ZXN0cy9pbnRl
bC94ZV9zeXNmc19zY2hlZHVsZXIuYw0KPiA+IEBAIC0xMDcsMTAgKzEwNywxOSBAQCBzdGF0aWMg
dm9pZCB0ZXN0X21pbl9tYXgoaW50IHhlLCBpbnQgZW5naW5lLCBjb25zdCBjaGFyICoqcHJvcGVy
dHksDQo+ID4gIA0KPiA+ICAJLyogUmVzZXQgcHJvcGVydHksIG1heCwgbWluIHRvIG9yaWdpbmFs
IHZhbHVlcyAqLw0KPiA+ICAJaWd0X3N5c2ZzX3ByaW50ZihlbmdpbmUsIHByb3BlcnR5WzBdLCAi
JWQiLCBzdG9yZSk7DQo+ID4gKwlpZ3Rfc3lzZnNfc2NhbmYoZW5naW5lLCBwcm9wZXJ0eVswXSwg
IiV1IiwgJnNldCk7DQo+ID4gKwlpZ3RfYXNzZXJ0X2VxKHNldCwgc3RvcmUpOw0KPiA+ICsNCj4g
PiAgCWlndF9zeXNmc19wcmludGYoZW5naW5lLCBwcm9wZXJ0eVsxXSwgIiVkIiwgZGVmYXVsdF9t
aW4pOw0KPiA+ICsJaWd0X3N5c2ZzX3NjYW5mKGVuZ2luZSwgcHJvcGVydHlbMV0sICIldSIsICZz
ZXQpOw0KPiA+ICsJaWd0X2Fzc2VydF9lcShzZXQsIGRlZmF1bHRfbWluKTsNCj4gPiArDQo+ID4g
IAlpZ3Rfc3lzZnNfcHJpbnRmKGVuZ2luZSwgcHJvcGVydHlbMl0sICIlZCIsIGRlZmF1bHRfbWF4
KTsNCj4gPiArCWlndF9zeXNmc19zY2FuZihlbmdpbmUsIHByb3BlcnR5WzJdLCAiJXUiLCAmc2V0
KTsNCj4gPiArCWlndF9hc3NlcnRfZXEoc2V0LCBkZWZhdWx0X21heCk7DQo+ID4gIH0NCj4gPiAg
DQo+ID4gKyNkZWZpbmUgTUFYX0dUUyA4DQo+ID4gIGlndF9tYWluDQo+ID4gIHsNCj4gPiAgCXN0
YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPiA+IEBAIC0xMjYsMTAgKzEzNSwxNSBAQCBpZ3RfbWFpbg0K
PiA+ICAJCQkJICAgICAgeyJ0aW1lc2xpY2VfZHVyYXRpb25fdXMiLCAidGltZXNsaWNlX2R1cmF0
aW9uX21pbiIsICJ0aW1lc2xpY2VfZHVyYXRpb25fbWF4In0sDQo+ID4gIAkJCQkgICAgICB7Impv
Yl90aW1lb3V0X21zIiwgImpvYl90aW1lb3V0X21pbiIsICJqb2JfdGltZW91dF9tYXgifSwNCj4g
PiAgCX07DQo+ID4gKw0KPiA+ICsJdW5zaWduZWQgaW50IHN0b3JlW01BWF9HVFNdWzNdWzNdOw0K
PiA+ICAJaW50IGNvdW50ID0gc2l6ZW9mKHByb3BlcnR5KSAvIHNpemVvZihwcm9wZXJ0eVswXSk7
DQo+ID4gKwlpbnQgZ3RfY291bnQgPSAwOw0KPiA+ICAJaW50IHhlID0gLTE7DQo+ID4gIAlpbnQg
c3lzX2ZkOw0KPiA+ICAJaW50IGd0Ow0KPiA+ICsJaW50IGVuZ2luZXNfZmRbTUFYX0dUU10sIGd0
X2ZkW01BWF9HVFNdOw0KPiA+ICsJaW50ICplbmdpbmVfbGlzdFtNQVhfR1RTXTsNCj4gPiAgDQo+
ID4gIAlpZ3RfZml4dHVyZSB7DQo+ID4gIAkJeGUgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hF
KTsNCj4gPiBAQCAtMTM4LDI4ICsxNTIsODMgQEAgaWd0X21haW4NCj4gPiAgCQlzeXNfZmQgPSBp
Z3Rfc3lzZnNfb3Blbih4ZSk7DQo+ID4gIAkJaWd0X3JlcXVpcmUoc3lzX2ZkICE9IC0xKTsNCj4g
PiAgCQljbG9zZShzeXNfZmQpOw0KPiA+ICsNCj4gPiArCQl4ZV9mb3JfZWFjaF9ndCh4ZSwgZ3Qp
IHsNCj4gPiArCQkJaW50ICpsaXN0LCBpID0gMDsNCj4gPiArDQo+ID4gKwkJCWlndF9yZXF1aXJl
KGd0X2NvdW50IDwgTUFYX0dUUyk7DQo+ID4gKw0KPiA+ICsJCQlndF9mZFtndF9jb3VudF0gPSB4
ZV9zeXNmc19ndF9vcGVuKHhlLCBndCk7DQo+ID4gKwkJCWlndF9yZXF1aXJlKGd0X2ZkW2d0X2Nv
dW50XSAhPSAtMSk7DQo+ID4gKwkJCWVuZ2luZXNfZmRbZ3RfY291bnRdID0gb3BlbmF0KGd0X2Zk
W2d0X2NvdW50XSwgImVuZ2luZXMiLCBPX1JET05MWSk7DQo+ID4gKwkJCWlndF9yZXF1aXJlKGVu
Z2luZXNfZmRbZ3RfY291bnRdICE9IC0xKTsNCj4gPiArDQo+ID4gKwkJCWxpc3QgPSBpZ3Rfc3lz
ZnNfZ2V0X2VuZ2luZV9saXN0KGVuZ2luZXNfZmRbZ3RfY291bnRdKTsNCj4gPiArDQo+ID4gKwkJ
CXdoaWxlIChsaXN0W2ldICE9IC0xKSB7DQo+ID4gKwkJCQlmb3IgKGludCBqID0gMDsgaiA8IGNv
dW50OyBqKyspIHsNCj4gPiArCQkJCQljb25zdCBjaGFyICoqcGwgPSBwcm9wZXJ0eVtqXTsNCj4g
PiArDQo+ID4gKwkJCQkJZm9yIChpbnQgayA9IDA7IGsgPCAzOyBrKyspIHsNCj4gPiArCQkJCQkJ
dW5zaWduZWQgaW50ICpsb2MgPSAmc3RvcmVbaV1bal1ba107DQo+ID4gKw0KPiA+ICsJCQkJCQlp
Z3RfcmVxdWlyZShpZ3Rfc3lzZnNfc2NhbmYobGlzdFtpXSwgcGxba10sDQo+ID4gKwkJCQkJCQkJ
CSAgICAiJXUiLCBsb2MpID09IDEpOw0KPiA+ICsJCQkJCX0NCj4gPiArCQkJCX0NCj4gPiArCQkJ
CWkrKzsNCj4gPiArCQkJfQ0KPiA+ICsNCj4gPiArCQkJaWd0X3JlcXVpcmUoaSA+IDApOw0KPiA+
ICsJCQllbmdpbmVfbGlzdFtndF9jb3VudF0gPSBsaXN0Ow0KPiA+ICsJCQlndF9jb3VudCsrOw0K
PiA+ICsJCX0NCj4gPiAgCX0NCj4gPiAgDQo+ID4gIAlmb3IgKGludCBpID0gMDsgaSA8IGNvdW50
OyBpKyspIHsNCj4gPiAgCQlmb3IgKHR5cGVvZigqdGVzdHMpICp0ID0gdGVzdHM7IHQtPm5hbWU7
IHQrKykgew0KPiA+ICAJCQlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWNfZigiJXMtJXMiLCBwcm9w
ZXJ0eVtpXVswXSwgdC0+bmFtZSkgew0KPiA+ICsJCQkJaW50IGogPSAwOw0KPiA+ICAJCQkJeGVf
Zm9yX2VhY2hfZ3QoeGUsIGd0KSB7DQo+ID4gLQkJCQkJaW50IGVuZ2luZXNfZmQgPSAtMTsNCj4g
PiAtCQkJCQlpbnQgZ3RfZmQgPSAtMTsNCj4gPiAtDQo+ID4gLQkJCQkJZ3RfZmQgPSB4ZV9zeXNm
c19ndF9vcGVuKHhlLCBndCk7DQo+ID4gLQkJCQkJaWd0X3JlcXVpcmUoZ3RfZmQgIT0gLTEpOw0K
PiA+IC0JCQkJCWVuZ2luZXNfZmQgPSBvcGVuYXQoZ3RfZmQsICJlbmdpbmVzIiwgT19SRE9OTFkp
Ow0KPiA+IC0JCQkJCWlndF9yZXF1aXJlKGVuZ2luZXNfZmQgIT0gLTEpOw0KPiA+ICsJCQkJCWlu
dCBlID0gZW5naW5lc19mZFtqXTsNCj4gPiAgDQo+ID4gLQkJCQkJaWd0X3N5c2ZzX2VuZ2luZXMo
eGUsIGVuZ2luZXNfZmQsIDAsIDAsIHByb3BlcnR5W2ldLCB0LT5mbik7DQo+ID4gLQkJCQkJY2xv
c2UoZW5naW5lc19mZCk7DQo+ID4gLQkJCQkJY2xvc2UoZ3RfZmQpOw0KPiA+ICsJCQkJCWlndF9z
eXNmc19lbmdpbmVzKHhlLCBlLCAwLCAwLCBwcm9wZXJ0eVtpXSwgdC0+Zm4pOw0KPiA+ICsJCQkJ
CWorKzsNCj4gPiAgCQkJCX0NCj4gPiAgCQkJfQ0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPiArDQo+
ID4gIAlpZ3RfZml4dHVyZSB7DQo+ID4gKwkJZm9yIChpbnQgZ3RuID0gZ3RfY291bnQgLSAxOyBn
dG4gPj0gMDsgZ3RuLS0pIHsNCj4gPiArCQkJaW50ICpsaXN0LCBpID0gMDsNCj4gPiArDQo+ID4g
KwkJCWxpc3QgPSBlbmdpbmVfbGlzdFtndG5dOw0KPiA+ICsNCj4gPiArCQkJd2hpbGUgKGxpc3Rb
aV0gIT0gLTEpIHsNCj4gPiArCQkJCWludCBlID0gbGlzdFtpXTsNCj4gPiArDQo+ID4gKwkJCQlm
b3IgKGludCBqID0gY291bnQgLSAxOyBqID49IDA7IGotLSkgew0KPiA+ICsJCQkJCWNvbnN0IGNo
YXIgKipwbCA9IHByb3BlcnR5W2pdOw0KPiA+ICsNCj4gPiArCQkJCQlmb3IgKGludCBrID0gMjsg
ayA+PSAwOyBrLS0pIHsNCj4gPiArCQkJCQkJdW5zaWduZWQgaW50IHJlYWQgPSBVSU5UX01BWDsN
Cj4gPiArCQkJCQkJdW5zaWduZWQgaW50IHZhbCA9IHN0b3JlW2ldW2pdW2tdOw0KPiA+ICsNCj4g
PiArCQkJCQkJaWd0X3N5c2ZzX3ByaW50ZihlLCBwbFtrXSwgIiV1IiwgdmFsKTsNCj4gPiArCQkJ
CQkJaWd0X3N5c2ZzX3NjYW5mKGUsIHBsW2tdLCAiJXUiLCAmcmVhZCk7DQo+ID4gKwkJCQkJCWln
dF9hYm9ydF9vbl9mKHJlYWQgIT0gdmFsLA0KPiA+ICsJCQkJCQkJICAgICAgICIlcyBub3QgcmVz
dG9yZWQhXG4iLCBwbFtrXSk7DQo+ID4gKwkJCQkJfQ0KPiA+ICsJCQkJfQ0KPiA+ICsJCQkJaSsr
Ow0KPiA+ICsJCQl9DQo+ID4gKw0KPiA+ICsJCQlpZ3Rfc3lzZnNfZnJlZV9lbmdpbmVfbGlzdChs
aXN0KTsNCj4gPiArCQkJY2xvc2UoZW5naW5lc19mZFtndG5dKTsNCj4gPiArCQkJY2xvc2UoZ3Rf
ZmRbZ3RuXSk7DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiAgCQl4ZV9kZXZpY2VfcHV0KHhlKTsNCj4g
PiAgCQljbG9zZSh4ZSk7DQo+ID4gIAl9DQo+IA0K
