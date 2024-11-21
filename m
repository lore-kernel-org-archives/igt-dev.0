Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C46D7877E
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 15:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D012E10E98D;
	Thu, 21 Nov 2024 15:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+06xiiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C365310E98D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732202938; x=1763738938;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=p5VBQhIcjLlqQS0DNb7zrdRYqq1rs1P7cAWynKbNok4=;
 b=W+06xiiAIP7MBdlkFimW3gkl6CT+qMk5f8FVxehxy6V8B4CoxZjcxm1w
 J86NKm7EQdM+tNfArcV9HwK8x+w1xFhtmS1PoM/HwbZ02a9l6JPOa5gUO
 n8t26GMaU0qRa2m2Gp69n6Zz4rsvQuqJECqIaFeA/nOq6o0qa4ltHGBrw
 2UhBEwc5iwGaKOySluI2qwajquXriTb8m79rbLWCcu/cvh1GN/pfP5JCS
 VHxhtRrlQFvPT59/90R/83cib/4EY3Rhl73715uSntAksmpeAQzxtTGTn
 9/BLKO3/+LWK13wmYhrEcT6kmN5mZsufLiFljzJVLlC7CajBDC2zBLsna w==;
X-CSE-ConnectionGUID: YnCoI5i3Q6CGgScriZs6UQ==
X-CSE-MsgGUID: GSAs66LpSH2gca99UiSWzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32069598"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32069598"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 07:28:58 -0800
X-CSE-ConnectionGUID: sYx7EMjgS1KYGUA3qwMupg==
X-CSE-MsgGUID: m/MwyLbSRS25xK4FiO010w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90266026"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 07:28:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 07:28:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 07:28:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 07:28:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaOKBqjTeLUNXxv43AT6RHBEYiYVMt5d8arbWbYzWSWp7IOrod8wzzURIm42k1wBBIcOzELlwO2NhRsDCM6O9QWHc96FDZ6G1w8w3o2vjQlwVWQS2e8xyWBdi8nJpA1sAon/b5o/8V6E5H9WoXEdZ46YqV+/Db8G9JCdR1k0ad8oQiw6294igy28WX4vwNtwqMk1eu4bIeylGNkvukCGcND44rXZwFknsgwHFPVF40sYOKp0ASZ83+6CP766Kh2hwuAG+J4s5LE7cCV46K3Ssay0o7B9wVGZYnevQUAREs1H66bp8jWoBZhOHY90pM3c5TG6AYX/hMAPFdgZnX2Q4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5VBQhIcjLlqQS0DNb7zrdRYqq1rs1P7cAWynKbNok4=;
 b=u95czTLmwkmK76/VRfkAw9r6zdBVtFJPsKdbnHqLIB6QfJuYvSI50SQTd/SWBpisebI0QbL12NEZtK9atKHBgzkc1zBDNQdsxkxl4zttHrnb6bUD7heOSE1+et+wBcONr9pRN93JyefpCS29iCYwUSnMBr3+IO7EwmEmQofwUj09uDGgqBMVfh51lKhBfJPoPloIvCvXO2dVBqolB7QCJ0DZmlvo6HhAxTpaLDmENWZYJ4GsYg5mCsXm+QjwZi2cty4Fv66xUZ7jiCrh2kg1cVn8cCEzYB0ResoBlR/K9GfbIGDmkCuYbIkm6eXVbD+unLG2md2vDcSGOt+bdLdZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 15:28:53 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 15:28:53 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 6/6] tests/gem_gpgpu_fill: Add offset-16x16
 subtest
Thread-Topic: [PATCH i-g-t v4 6/6] tests/gem_gpgpu_fill: Add offset-16x16
 subtest
Thread-Index: AQHbPBGikkwqLBMT1E2I384uKlzfV7LB2/6A
Date: Thu, 21 Nov 2024 15:28:53 +0000
Message-ID: <01a244b6dbb9f0f5a82be32a21083e4b33b93e16.camel@intel.com>
References: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
 <20241121123308.98158-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241121123308.98158-7-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|PH7PR11MB8551:EE_
x-ms-office365-filtering-correlation-id: 74898d2e-f3dc-42a2-33e7-08dd0a4134f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Yldyem1wWXd2cThwRUxwVGsrdERsZ0t4bE1tYWpHTGxYY3RQMFRnZHFlZS9U?=
 =?utf-8?B?VVV1Vk10THl2ZzRBc2N6eDhGS3YvUEZ0WUhBVFE1VGhldkcrTll1dzhEd1FM?=
 =?utf-8?B?cDZmTDFUVk15R3VWd2tUbThDcnkydUtLUDlobjZqUnVZeVczaWdpU203YXBG?=
 =?utf-8?B?V2QwbzF0SU1Hb1hkQnVoOVk5K0ZTWENrM3FRL01ZME1TeGZHQkQreGhEM2I4?=
 =?utf-8?B?VCtaK0ZIeGEyeDhPTUxWNlJ5NzNZUU9XaGNJN2piZ1NDUitRN1ZKQUIzSDZu?=
 =?utf-8?B?bkxKSG9UaDJIdkQ5UVg5Y3EzU3RxMXBPYjZtVUxzeVZKL0xDQkZCaEtKbDJy?=
 =?utf-8?B?YXEvOGtUY1ZrR2pKb09pUGxKTmJQOWJHbFU1UE1SSWVWbDYwdXJuMDYxdlBS?=
 =?utf-8?B?dWhDR3FHRzh4Vm9MZi95UmlEYlM2S3p5T21WOGM1RXVKYnVTTTFValdrNW9W?=
 =?utf-8?B?dWJsRlNKYjQwcUdKanRvSDVVU3pqYzE4c2N5d2RselhMSVhramlpZi9USE83?=
 =?utf-8?B?L1JtQWthVGY3c3pvekVZZWxZc0RJb1dadDdrTnNxRDFNRy9uNVVaRjEyOHJz?=
 =?utf-8?B?WjlVak9qcGZacHdZdmJuR2o4VzJCTlpURHdmWThXTnN0NE1uaGxlbFU3ZklP?=
 =?utf-8?B?ZklwNlBEYlF5SC9hQ01EcmI2b1BacG9jcG1wUk04UzhieUlLbjMrWjZ3Y2FI?=
 =?utf-8?B?WlFmanl4ay9yL1Vid3RxNTFZT0dESWVWZFhDMm4xdFQ4WWlGZUdSNU5BbXU1?=
 =?utf-8?B?Zk1pUlppOXhqN3BHWG4waWJmdStpOGZrWkU3L2Qrbjg0R3Y5Nm40OUNDTkhT?=
 =?utf-8?B?cTdGeE0yOVkvVXdNc3RjajU3ZkJaQS9qbkorUjZDRG5IQjhVbkJPUFRML09t?=
 =?utf-8?B?L29RdUtwbm5teVZRMFhTZk92QUhhZGxJVTc1WjMvRWFxaHFiQTNPN0tnd1Fy?=
 =?utf-8?B?SkZHa21QT01ONzRqTnpqWnlUU0VwR3J6aFVkZU5WdzVPNjFYN2hyUUVsUGF4?=
 =?utf-8?B?UldtL3d1TzhXd3RRTlBlU0JEdmZ3cXNodHIvS1crRkxlZ2liOVE1M1g4YWJF?=
 =?utf-8?B?NDN4RjNKRGU0MWVwWmVOM3d5dXVmR3JKQnlHMEJTSWd4UnpydFpTK2dxT0hu?=
 =?utf-8?B?QnVwdVBaR0prc2Y0ZTdnYjB3T2R2SXBXTHFPdWxiYVVRd29DZ0I5clpOZWZM?=
 =?utf-8?B?cDBNSWE1Vm5peCt4MHBEN1N6Y2NsMzI1QWtHNFRHMkgwQlVodlYwZDZORGtr?=
 =?utf-8?B?ZXROaUkxdEc5M3l5ckJZem0wVkJSNjAwK1UyMzVEMkFNMm1od0FZZGRrTHNQ?=
 =?utf-8?B?amZYYlZMMUdnWnlxMnk4Ty9nNmtOd09zZC9vVWVRZ2Q0dnRXb3pqWGFDdm9H?=
 =?utf-8?B?YVU2aG5aaExlVXR2dTYxTlNkenpLUk1rL2NvUGVGcUNxc3lseUwxamlDTE04?=
 =?utf-8?B?dGdWVHQ5Y2xyWmhjei9uTmdZQlN5dW9KdkYrMFVTNENJUWRua1hIRGM5TGRa?=
 =?utf-8?B?YzMxN283RlY3LzM4U2JKYnJkMDZuaDcxa243MkZXdSt6WHc0VHpQYXpPNTlI?=
 =?utf-8?B?dm9HV2dVRlhhRWo2aXRtY2pKU3d2N0RxOUs4b1BIT1hjekovKzJOSWlkZ2xm?=
 =?utf-8?B?TUpyU0RhZU5Xa0VkMUo1anhlM0tIMFZJdmMyL1dsTnJlV2JaRFF5V0VnMWI1?=
 =?utf-8?B?VmllM2l4SHN1bnZ6VENCMHZIaHpBekNIemluVUpWV2QzM3RyaTNjOTBwajR5?=
 =?utf-8?B?MG0rei9pTHFIUTRCTFhPQnFCSWwrNDArQ25TSmxaYm1rSEhhcDF3TnZNUXhV?=
 =?utf-8?Q?eXEjmZ5XKaZJ/RLFqyiKxGkj4KGAdCpHiM5S0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTB4b0o1d1VpM3pDZ1NheUM0UVVTb3FpQ3F4VHo5bVZ0NjdaeEZyTTViQmpM?=
 =?utf-8?B?Z1FEYmFEbmJBK3FsZWI4NDBTYVlIRXlJb0VLQVA2ZE1nZy9DZlYxNFN4MFhR?=
 =?utf-8?B?WVdyUzZXMS90WUF4ZnVxV01Kc2ZveHRKblBBL3d4LzByaS9NSDU4ZGRSV2VI?=
 =?utf-8?B?QmtnRVRXbzlxZm02cVAxYzkzMjJtb0gvdjc0YkhNVWpLSEFxYVlVbVFKWHNt?=
 =?utf-8?B?YnczbHFQQ25rNHdURER0TnFtS1B5WTZlLzZsR2xndjNhT0htM3RhdnByRjBo?=
 =?utf-8?B?SnlGOHcyQ2JLWUc0eVFtK0lPY2lSSEFqSnBocWgrNGdqOXhuRG43VkJGU0tB?=
 =?utf-8?B?dEhsYU5zYXNUamVkc0FlUTdxbjJ2dy9MWm1HM2VZUE5kdUo5UEkzYzY1NzBB?=
 =?utf-8?B?anY4K3NUY1NGYUh5a1dHMFM1c2lUWTFUb1VFWTdndUFSRmtEK0t2QnVMaXpR?=
 =?utf-8?B?ZVk4QkRpc052WFhFT2tWRkJkWU5uWDRjOEJUZk9wa29Deld2a0lxL3RGdm1a?=
 =?utf-8?B?Nys4aFkzdTQ4UGZqUmZNZ1dlYzVsNk9LN01DNVR5eTkvbDJ0Y1hWWHE5QnNy?=
 =?utf-8?B?UFZ0MGJ0SmQ2UlhTRzVYK2hIdjIvNTR5TlRIQ1RYd1I2TU5VVXZvc2l4aVFE?=
 =?utf-8?B?d2kzdEJRVXM0andZT1c5VWx5V09Ya3VkMnp4SkFrRGdPWjdES0U4U1VpM2tW?=
 =?utf-8?B?VXg1UUNZbm5oaVVnMWlXeGVsRDRKMXMwMWNPbm05eFJkS0ZWakhvSWp3NVFN?=
 =?utf-8?B?OUN5TUc1TFdWcGROTnpnUElFRUlUTVdNVXJIRmdyZWNObktZWEpMdU5sZFo4?=
 =?utf-8?B?RTlXbHR0WDUzelpwRWR4L1JrM0RyMXErUGRrc0NOSXlMY1YwOGg3Q3cyVXRM?=
 =?utf-8?B?eUs3ZFI1S1dBakdKNmt0ZHFhS0c4dXQvSGRWdnZRUlZERmJPN3h3L2p2UjNp?=
 =?utf-8?B?MituSXVrbzN4S3hQTVhndFpEODU1M3ErbHNNUWpvNTdFSGNDbEU0ald4MHNq?=
 =?utf-8?B?VWVSeHJIWXMwcU1mSjJhK1VTR0ljWlZjUlU0TmJ4VDQ2TFVBTGJ5WmNCNUVx?=
 =?utf-8?B?NGFpbHZkbSsyc3NJeW9jN2VpdVA0OVNJR2M0STRsMXhHdk9kK2FjUTJPbUJt?=
 =?utf-8?B?OUpJTkh5cVd3TUxONTdZUlVHUDlRMkRsbUdoZFlxelowWDFJSURKdWQzOUlG?=
 =?utf-8?B?cm9xcDZmMm5pdG9nTE1SZ0VWQ05rbGwvckEvaUxGQ3N1bncwV2ZWNm9IUVZl?=
 =?utf-8?B?ZXFlc09zdEF2MjlzUk5VbmFzbkZhUnMzOHlzMHdsRHVlNERhZDViRXY3RCto?=
 =?utf-8?B?c21URkRvTnIvd0MrQ3F5MFZseCtuN2NWcURFblljVDFSQWRCbXZjZVg4OUYr?=
 =?utf-8?B?U0dmY2FNU0pYYkt1NThaM0R6dW9lUGluSlZITU55Y0gwd3JhNk8wbEFNaE02?=
 =?utf-8?B?UWhIUGFWbm15SUdKQ2E3ZTRub3A4YjlpNG5CWmxuaERjelM1RmZ4RFZFUGlF?=
 =?utf-8?B?R3hQaFpZa2FPNm5UeGFpcXRuOTdGL1o1SThSM0VBRjVKL0JHSFpidHBDY3pm?=
 =?utf-8?B?SW8yQkt4VHVXUDM2TS9Sb0pUaUU4MnBoZUQzSExnQlJwbGdOTzMrNVlHTTht?=
 =?utf-8?B?NUZIRFZoenFmQ0FSdzIyTnR1aEIwL2p1TXg2Lyt3WVFmbDQwUjBiVTF6bWpi?=
 =?utf-8?B?QlJHdVVRUlRBV09FbW5FYUh5b3ZueFNnSTgwK2QrYmI3QWVsQ2xNUjA3aVRU?=
 =?utf-8?B?MUR2OERBOUVSWEdHNHdDSnRpeFR2ZGhYWDZYdk82TzdyWmxmbmVuRzJCYzBt?=
 =?utf-8?B?R2U2dExQZlQvTGRMUE9lenFjSXpFNURmYXJEbERxd2dvMDBYTTV2OEVkU3dH?=
 =?utf-8?B?dzN1anVWdG9CSnNUeExVUytMNkJYVGF6NllSTW5LejNLcTF6cjZYTTFMZXBH?=
 =?utf-8?B?WXVzQ2ZXQXlmeXlneFVVaDFGdHpLY3preHFZck1UWnJlWHJkVEF0OTF0SExH?=
 =?utf-8?B?VklCRGJKQ1YxcFBPT25HOUlZcm9VanBGRStWRFlUUk42RjVuT2t3WmFNVks3?=
 =?utf-8?B?WXRhNEREOXNSK0NCQjlqenR4VU0zMWJRdDRDQ29QcjFDUmRFUWFqNkxoai9K?=
 =?utf-8?B?clpMaDI2Nnp6TVpGK3FGbGE2aU1SU2wyb3BwRjIyVUxvN1VaMXk0cm1zTVRP?=
 =?utf-8?Q?b74/li5n/by/7SWc7d+Z3EQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BBD29CFF9F3EC4DAC8D5950C9269C8E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74898d2e-f3dc-42a2-33e7-08dd0a4134f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 15:28:53.3908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FYUU2WhRCuMRJo+92BCCzt8ObQFY3TpAGlyHK3kw/2ID+HknyZnRMvz8a4AvRoM+wyNt1eMAuoBvqEcFMwtw9cCaa0AdzmljI1vK2zvENB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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

T24gVGh1LCAyMDI0LTExLTIxIGF0IDEzOjMzICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IEFkZCBzdWJ0ZXN0IHdoaWNoIHZlcmlmaWVzIHJlY3RhbmdsZSBmaWxsZWQgYnkg
cGF0dGVybiBzdGFydHMgYXQNCj4gb2Zmc2V0IDx4LHk+ID09IDwxNiwxNj4uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGlu
dGVsLmNvbT4NCj4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC9nZW1fZ3BncHVfZmlsbC5jIHwgMTUgKysr
KysrKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9nZW1fZ3BncHVfZmlsbC5j
IGIvdGVzdHMvaW50ZWwvZ2VtX2dwZ3B1X2ZpbGwuYw0KPiBpbmRleCBlYzM0ZTk1ODQ0Li5jZmVi
YzhmNjY1IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9nZW1fZ3BncHVfZmlsbC5jDQo+ICsr
KyBiL3Rlc3RzL2ludGVsL2dlbV9ncGdwdV9maWxsLmMNCj4gQEAgLTU4LDYgKzU4LDEwIEBADQo+
ICAgKiBGZWF0dXJlOiBjb21wdXRlDQo+ICAgKg0KPiAgICogU1VCVEVTVDogYmFzaWMNCj4gKyAq
IERlc2NyaXB0aW9uOiBydW4gZ3BncHUgZmlsbA0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IG9mZnNl
dC0xNngxNg0KPiArICogRGVzY3JpcHRpb246IHJ1biBncGdwdSBmaWxsIHdpdGggPHgseT4gc3Rh
cnQgcG9zaXRpb24gPT0gPDE2LDE2Pg0KPiAgICovDQo+ICANCj4gICNkZWZpbmUgV0lEVEggNjQN
Cj4gQEAgLTIzOSw5ICsyNDMsMTYgQEAgaWd0X21haW5fYXJncygiZFc6SDpYOlk6IiwgTlVMTCwg
aGVscF9zdHIsIG9wdF9oYW5kbGVyLCBOVUxMKQ0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+ICsJaWd0
X3N1YnRlc3QoIm9mZnNldC0xNngxNiIpIHsNCj4gKwkJZ3BncHVfZmlsbCgmZGF0YSwgZmlsbF9m
biwgMCwNCj4gKwkJCSAgIHN1cmZ3aWR0aCwgc3VyZmhlaWdodCwNCj4gKwkJCSAgIDE2LCAxNiwN
Cj4gKwkJCSAgIHN1cmZ3aWR0aCAvIDIsDQo+ICsJCQkgICBzdXJmaGVpZ2h0IC8gMik7DQo+ICsJ
fQ0KPiArDQo+ICAJaWd0X2ZpeHR1cmUgew0KPiAtCQlpZ3RfY29sbGVjdGlvbl9kZXN0cm95KHJl
Z2lvbl9zZXQpOw0KPiAtCQlmcmVlKHJlZ2lvbl9pbmZvKTsNCldoeSByZW1vdmluZyB0aGlzPyAN
Cg0KUmVnYXJkcywgDQpEb21pbmlrDQo+ICAJCWJ1Zl9vcHNfZGVzdHJveShkYXRhLmJvcHMpOw0K
PiArCQlkcm1fY2xvc2VfZHJpdmVyKGRhdGEuZHJtX2ZkKTsNCj4gIAl9DQo+ICB9DQoNCg==
