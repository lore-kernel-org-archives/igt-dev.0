Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CCFC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 11:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A65B10E008;
	Wed, 29 Jan 2025 11:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPdYUexq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D749310E058
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 11:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738149260; x=1769685260;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bhxzMcUYEiccn9xtZG8XKFLX6zxcThWyvyIXEpXU5IU=;
 b=kPdYUexqaaRg/lhNidOR2v10N9+jp/IGeOpkYvT9BA/cj3bg+dYYMogm
 9Rba+He++19Zj+VNkWrbiuWOdNHiIU5xtvvKZvz0KOQ7h20JCh51/22r5
 s+bwOiQ6/n5KQVE5NezuXpgDAYeTNDyPKVmUazbRBNLZUZePeCxwwmCnG
 acfznNZNHlksfpT4jLssme9NiBmBGXrULVtEOFs5VePRtsVsp7q2Un/E2
 F+j8g3sc9i9lFuoL0lxQnM8vdI6f2mmwW/HcK64txrOh/VUyQiI5pj/En
 vNGRfNYQnnOHmxAzgP+gk2n5sWmZdVi9O+rOPy14EHFM/yCCvVfjz9DUE g==;
X-CSE-ConnectionGUID: u0jnjTK2QpKn9uvUmk9njg==
X-CSE-MsgGUID: 9CElcBsPQMy18VK0g14pgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38688193"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38688193"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 03:14:20 -0800
X-CSE-ConnectionGUID: sebywG40Q624ZSNHwOaVtA==
X-CSE-MsgGUID: NImvfcEsT/+/ku5E+JCiQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114135057"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 03:14:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 03:14:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 03:14:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 03:14:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0LljOKnuAwn5jfmzagZ5jF8/utpP7aiXNi/deGFxGTDWLQ0cp9kEm55RXJ/Olb4qBoEx+LI9WsCS+zVOBjpG+xLm/ctYDjYEkfpHGT2uYoH5ZP+sqrlKDcxRs9lI1ppx96WHi0ic4abXtpdNkVx9aa70sLKEDL8I5zJwRIdKe/kUiXmbv/xgzzYEwHUixNZ7nlIk8GU3vCLA5/4Rg2Eh6cwLw381fu49v3ngo+jFydZj1LbWUv6POEdPTagWM0ukXav/3RiDCKYS1AIicWk6x6caFs4EPAF221Mlm2uEl+d9J8hWfcbx8iM4Y0XnduEcOtA7zzNEMNgc9xqqEejog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IKVCOLBESJv5VcqV8cYnIYnQ0IhU+8l3jyq0xmFAcQ=;
 b=pf7JMJ4uubDywf+H8O/t/fKSdXT7QWOzmgXPzlRnNNTpH/+TiODVtMEFuFpOTXSanD6AidThoT/VYh+O2CWIbbM950q914QwFUUssrD/4Q+yJMqxDY3bc1CF0vNBWMiGNN43PT5gvHo30TMbfERHiissNiVT7dBFXybwQo4jooNz/4w75CAD3e/lvqJ3S7iOypExBsD566rUPjbifXm3HbqTdwzYvdQx88yI4DoZlTwyQ5XVWfkYUqWi/yKK3BS4Kw7XymJms4cduFJX+1FMbjXxM/ilQAb8aF9ieTkTXNVWJTCk31idGq2IsrjyBlwnrrsnHcYlQGTfxCFBQ/2Sqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS7PR11MB6272.namprd11.prod.outlook.com (2603:10b6:8:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Wed, 29 Jan
 2025 11:13:56 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 11:13:56 +0000
Message-ID: <781887ce-3e8a-470d-b644-7130e99cfbdb@intel.com>
Date: Wed, 29 Jan 2025 12:13:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [v3, i-g-t,
 1/2] tests/intel/xe_sriov_flr: Add parallel FLR subtest for SR-IOV VFs
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250116192906.636031-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250116192906.636031-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0111.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::8) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS7PR11MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: b78e9117-6a2f-4d1a-ba9c-08dd405605b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?empjL3p4Z055VnZnSldCb0pibm4waFJ1eUZONnRoZ0JjR0U4YjU5UnhnRS9w?=
 =?utf-8?B?SUNUMVQ2dlN6TDhveXZxd2pzQy9sRENycGJJY1NWMW5GZTRXdHhSQ1Q0eU9r?=
 =?utf-8?B?RjJYUXZXc3VuVzR2U1U2L3cybUpNcmNGVW5GY3VFWkwxMmVLbFNEa05OVHJp?=
 =?utf-8?B?enUxK2FxdVRYRnQvZ0tIZkhVdi9QTlVzdUJoNFpzMi9Sd3NzUW1nVFV6aWNZ?=
 =?utf-8?B?ZGg4aFFXZlYzUGRwNWh2RzZMSGgxMXQ4ZDllTEUzWXJheGNpaEhqMTl3eUxW?=
 =?utf-8?B?MUczY0RzS0MxeHUzdGpzdERxRk5JNy9jbXphaG1QcWQ5b2hmOEFNVXJQU3hy?=
 =?utf-8?B?b2U4UzFIbFQ5cWl6ejlBTTdWY1d0enRYWk5JdmpTRm5uSVBxb1B1dVluRzdD?=
 =?utf-8?B?R0x5U2s1ZC83MHk5clh4anZWeVUzVm1Ud1p5dFpOUzRSUFAzb1FoV3NoYytZ?=
 =?utf-8?B?b2VqUytWeSsvWXl0Z0xhWUI2cVJybE05ZkUxVVJ3d2RmQUJsV3I1VGVNUXRz?=
 =?utf-8?B?dFArY3Ztbjk4ZUN3S1o1eWI0Z0lrQTk4Qm0wWEl6YXVNWjdSeGxXNUdlZVM1?=
 =?utf-8?B?RlhjWEpEbkN6bHZtSHIwL0ZhUzk3dEg4ejVzcHVvSmo0emk5Y0U1eUU3LytP?=
 =?utf-8?B?eFdNdWpacWF0SzVkay9HZ3Q2OVBEZExpV0NiQyt1NldLWlFxODhYU1BQVFZi?=
 =?utf-8?B?YnBvVkExMGozcTB6WEMzOGlaWjRGU29hb1NkSjl0Y0VDeVBReGpJcFJablFh?=
 =?utf-8?B?T2ZldTR1Q0dsWUs0MjdvQjRzOXYyMTQyT0FUbnFYVVdzQis1ZVdHbjJhSk1W?=
 =?utf-8?B?YTNyMjN4RVBVNWhsNzRsTHlWeXF5R1dudld0aThzL2ozTVltOHY3YXFzQisx?=
 =?utf-8?B?eWo5NHNwY0RNVUkxczQ4RklpUE1vK3RhMDE2ME5WdXBCQjVCd2JXRUU3MmFM?=
 =?utf-8?B?amRpa1liNEpQamU1SFFldlEwZm1ra3VBbENySW1QaGdrVlV2UVF1YXdhZFJR?=
 =?utf-8?B?cGtTbkpma3ROcWlrZEdtRTVLRDBnSis1RlJwbTZ5cHNtRXRhMVYzc09XcnRo?=
 =?utf-8?B?MXhHUFM5Zk5nNGRtOGJ6akRtRUphNU5QTGQzRFZ6WVVoVXVhNU1CNlVVTHNm?=
 =?utf-8?B?TFRCN1h6aEZQZDlabTVpb3cxaVAwUkdPTU5md00yakIrZEVHR0V1WTR4ZVVC?=
 =?utf-8?B?TG03S2ZOTm5mQUUzbDFJUlpLZW51YTg5V3NwNWx6YnZqY0x5QVppWkJNL3pn?=
 =?utf-8?B?NG5RTUJVb3pFM1hJYUgyc09sa0dWMFpVV1U1MWVqRnVZaGpWQ0hHTVJUZDZi?=
 =?utf-8?B?L2pVS2s4S2tDV0xMUm9BRklXM2VtcDRqc0p2ZGtkSDJKQ2doMlU2RXpOMkRV?=
 =?utf-8?B?TU94aDRZbS85WUZvT1dROXYvbmFzUHMwWlNyQTkxRG9ZaWpXaWtYTjBIRnpF?=
 =?utf-8?B?bU5mN0g2Mmg1QXVUQUZJdzdFb1JLdzJmanJZeFVoQ2U3NzlGOXRZVWwyK1Ur?=
 =?utf-8?B?YWIrZ2NpQjQxeFNIRlIxVnVrU0h4aHB1VUFNcElpZ2lrVGZ0MHd4Q0N6VzE0?=
 =?utf-8?B?R1pIYXZENlBkcWdBVnpFdzR5UlNvZ1Jyci9QRG5udnhZUkdxRjdnaFVRbWxF?=
 =?utf-8?B?WnN5elFnQmJ6V1EvVHFtWWwvYm8zWHNvdkk0WmpCWEVvekE3djVoeFkvb3do?=
 =?utf-8?B?N1JzWjBmcWhTdHZtbjNseGIwL3lvUnUraGZ4OXZsU0FRaHVEMzNnWGpDZjRZ?=
 =?utf-8?B?VWc0RzRwWTZCejJoZlZCdExBbkcrc2xnMjZnMmVQaTFuKzhUNjRlRjdCM0hX?=
 =?utf-8?B?N1VvSmhFTWNVK0tVMGE0N0p2VGhVb3l1NUlrUVJuY3RpaHp3eTRzendhZGRG?=
 =?utf-8?Q?lMXpXN6A25FA1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0ZzTUlZVWlLOVVvczFRd0RQelBHMlQxMG1XdWp1QnpFZzNBdUdCUVIwQ1Az?=
 =?utf-8?B?OUpwdkxVNzhFcEJtS25lV2QzSTMvUDl5aUlLZ21XRWhtT1hxTlpsSGcvcGlh?=
 =?utf-8?B?eUlSRU5XaCtrUTFIdkVTajJSUXJwUk8rN3JRWjlEQjIrVWZsanV3L2NKY21m?=
 =?utf-8?B?M1orMjJrSEt0dkE5VDhZUm1SZVpPTkpGOVRVVDRxckRIcGpkYVpOZERUUVFB?=
 =?utf-8?B?a0xQYnB3MlVGb2ZET3ZkMFZ3UWExMzhCa3pHRzBuZy9pTThiS3hmSUpHSTJG?=
 =?utf-8?B?Q2lNaFk2SUhwMENkdUtrTmgxbkJnV0Q4cEphOUFieVVrUUtxMmNjMStJWU01?=
 =?utf-8?B?TE5VTWxPOU82STlJN1BUVXJ4d25XNzRGaUJza2UvYzJMT2trYUYwWXpTeVNX?=
 =?utf-8?B?RkNBY29DT1dEVFlKc1FvZ2d3MW9qOHc4QXpnaHExa3Z6TXVLK3hIWThqMUpa?=
 =?utf-8?B?Qy9KZDJZYU5ocjIrZVNMMFZvczFLNVlNZUorZENaRUozSFhJaVpZNHdIUmpQ?=
 =?utf-8?B?WjNLbmRHV2lIaEN1VkVnNnlncmFLSld5NTlxTVFlNGRsOWQ2QkFwMzFUNGo2?=
 =?utf-8?B?OFE1VjdBWVhLRjR6bFEyZHhFbXZoK0oxOXZmRG9RQ2l4Q0ZEaXhDSkxmZ0NE?=
 =?utf-8?B?VjlJdFBST0lMVXpBd20xRWJDaVRwUE9yb01WM2JFYVdZVWFrTGxlYzk5d2sw?=
 =?utf-8?B?ZWIyVDFBS1VxVS9kbGtrWWdrekoxN3NXd3hRNDBqZGRqSlRiajNtaVlQWjkr?=
 =?utf-8?B?MFRoT3YrQ2plQXVnM1hCUnN4VTZQdmlBZDVlUHV4bXF4TURia0NXQTFTTXlk?=
 =?utf-8?B?QzgxSVg2NjkwdmplZUNHb3E2VWx0YU43UUFyVi9tbVFmYUdOTFc3R2pubWg4?=
 =?utf-8?B?QzZsNkZxcjd1c3U2ZlBuNE5WWWJsK2ZXTG14Y1dEMWpSQ1l3RFpRQlA5bzJm?=
 =?utf-8?B?QlJqSVVMZ21uUXZpcmdtME0vVDVUOGJnK2dkRERJMGJram85aUM2RmR2MmFm?=
 =?utf-8?B?aHRDZktyNXozV013dnhTcmJIQndXSEN0UmhKb0ZTQlNjUGVkQnJFbTYwSzlD?=
 =?utf-8?B?eTc0YnlWUWIwS2ZxNGllRjEvT252STYvcEc0Rk5tU0YxRFJHVmlFMmMwaWVD?=
 =?utf-8?B?WkRJNlFQMVpkNExNNjIwd0xUcWhOdDg2aVlJTHZOd0VtMXJjVXgycEpLR3ZD?=
 =?utf-8?B?SEc1enlUcjk1NHh5R1dHR1pTQmIweWdMMmtkaDcvcXNLZWFNVTlHR3hQTkU1?=
 =?utf-8?B?OTk2T3RaNVJwQXFuLy9xYXhpTFRvLy90dnlMcm43K1dPbG5FdzJ6MTZGKytq?=
 =?utf-8?B?SnZCSjFrcEplK1dwSmpvTnBKd3I3QnZCelp5T0NqTFRKTnVycEZnUlh1SXJR?=
 =?utf-8?B?YzluV2JrcmFjSE9oTklQOWxveE5PRnV3aFhxbi9IMS84RkdmSnh5Mzc2ZFZS?=
 =?utf-8?B?bFdRc3NUcXFhQXJNMjVxRnRrMHkyd2pjclF0cHhTbm5jS0NQdTJVVzB2alFJ?=
 =?utf-8?B?WWphS3IyY1RweGpzSHBPMFdieGNpZE41VXBWN3NYWG1maFVZWFJEVnk1MVRu?=
 =?utf-8?B?eFR6bkQ5Y3JlS0p1NnBCbmlJeUxiQmdubHZWZ0Exbk95aC9xRW1mMGFiZFBU?=
 =?utf-8?B?eStMWkhobkN5S2hZOFpOck9YRk0veTM3aWY1Nm5sU3BsK1hXelZ4bHBOSE1o?=
 =?utf-8?B?RHVxdHB2QkpzV3M2QWdjLzdNdlpJUDhPZUhnallHL3lCeVh5NEU4QlpzQlhX?=
 =?utf-8?B?a01aRHcrTVQ5bXNJWGxLNEZvam5lS3M4SVdNcDJqNnlJQTJ3WTNEZ1VFaS9z?=
 =?utf-8?B?L09UNkNJd0N0MDFJZStNL3J3ajVRVlczdmZERmRudEMwa1pqN05uT1ZxNXFX?=
 =?utf-8?B?dW1nSlFLaEE0a2taYy9HcngxblBIY1ZUQTZmU0I1cHlyMDhySXJORkZZT1lW?=
 =?utf-8?B?NXNObU1NSGlRWnZ5UXJTeW16S3hKWUx6dmJnT2daclVTbXpkenlhT2J1V1pu?=
 =?utf-8?B?Mk5KRFlITDA5cjlKYXNlSDBCeVFlakRnUTBmNVBRQ3FwUGZYY0R5cGpjMzFx?=
 =?utf-8?B?RFdpZmZJelFHVldpUWo4aFhwbVR0aWNTK3J3WkFML3hha0o1RXQwT0h3NURa?=
 =?utf-8?B?aVFkWGw4TG9Nalp3VGxLbWxVZFFMdFJ2ZTNkRWZCQjRYWndlS0lmR3A5Uis5?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b78e9117-6a2f-4d1a-ba9c-08dd405605b9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 11:13:56.5891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igoXagolounp9DICmLMVZpE77eZXq9wc2nKTB+LZVVW61SMr0Pfa3T6RAh5nWuR4zSv13SE2p3fYWMuySYQKkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6272
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


On 1/16/2025 20:29, Marcin Bernatowicz wrote:
> Introduce a new subtest flr-vfs-parallel to validate parallel FLR
> execution on all VFs. This subtest ensures correct behavior during
> simultaneous resets.
>
> Refactor verify_flr to accept an execution strategy function pointer,
> allowing for both sequential and parallel FLR strategies.
>
> Update clear_tests to use the new execution strategy approach and
> modify existing subtests to utilize the sequential FLR strategy.
>
> v2: Reintroduce condition to reinitialize test data only if more VFs
>      remain to be tested (omitted when extracting execute_sequential_flr).
> v3: Introduce threaded FLR initiation to achieve better parallelism
>      by mitigating 100ms reset delays.(Lukasz)
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 210 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 186 insertions(+), 24 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 550d58bb9..a8d35be31 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <fcntl.h>
> +#include <pthread.h>
>   #include <sys/stat.h>
>   #include "drmtest.h"
>   #include "igt_core.h"
> @@ -35,6 +36,11 @@
>    * Description:
>    *   Sequentially performs FLR on each VF to verify isolation and
>    *   clearing of LMEM, GGTT, and SCRATCH_REGS on the reset VF only.
> + *
> + * SUBTEST: flr-vfs-parallel
> + * Run type: FULL
> + * Description:
> + *   Executes FLR on all VFs simultaneously to validate correct behavior during parallel resets.
>    */
>   
>   IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
> @@ -210,6 +216,26 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
>   	igt_skip_on(skips == num_checks);
>   }
>   
> +/**
> + * flr_exec_strategy - Function pointer for FLR execution strategy
> + * @pf_fd: File descriptor for the Physical Function (PF).
> + * @num_vfs: Total number of Virtual Functions (VFs) to test.
> + * @checks: Array of subchecks.
> + * @num_checks: Number of subchecks.
> + * @wait_flr_ms: Time to wait (in milliseconds) for FLR to complete
> + *
> + * Defines a strategy for executing FLRs (Functional Level Resets)
> + * across multiple VFs. The strategy determines the order and
> + * manner (e.g., sequential or parallel) in which FLRs are performed.
> + * It is expected to initiate FLRs and handle related operations,
> + * such as verifying and preparing subchecks.
> + *
> + * Return: The ID of the last VF for which FLR was successfully initiated.
> + */
> +typedef int (*flr_exec_strategy)(int pf_fd, int num_vfs,
> +				 struct subcheck *checks, int num_checks,
> +				 const int wait_flr_ms);
> +
>   /**
>    * verify_flr - Orchestrates the verification of Function Level Reset (FLR)
>    *              across multiple Virtual Functions (VFs).
> @@ -222,18 +248,20 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
>    * @num_vfs: Total number of Virtual Functions (VFs) to test.
>    * @checks: Array of subchecks.
>    * @num_checks: Number of subchecks.
> + * @flr_exec_strategy: Execution strategy for FLR (e.g., sequential or parallel).
>    *
>    * Detailed Workflow:
>    * - Initializes and prepares VFs for testing.
> - * - Iterates through each VF, performing FLR, and verifies that only
> - *   the reset VF is affected while others remain unchanged.
> - * - Reinitializes test data for the FLRed VF if there are more VFs to test.
> - * - Continues the process until all VFs are tested.
> - * - Handles any test failures or early exits, cleans up, and reports results.
> + * - Executes the FLR operation using the provided execution strategy
> + *   (e.g., sequential or parallel) and validates that the reset VF behaves
> + *   as expected.
> + * - Cleans up resources and reports results after all VFs have been tested
> + *   or in the case of an early exit.
>    *
>    * A timeout is used to wait for FLR operations to complete.
>    */
> -static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_checks)
> +static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
> +		       int num_checks, flr_exec_strategy exec_strategy)
>   {
>   	const int wait_flr_ms = 200;
>   	int i, vf_id, flr_vf_id = -1;
> @@ -242,6 +270,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_
>   	igt_sriov_enable_vfs(pf_fd, num_vfs);
>   	if (igt_warn_on(!igt_sriov_device_reset_exists(pf_fd, 1)))
>   		goto disable_vfs;
> +
>   	/* Refresh PCI state */
>   	if (igt_warn_on(igt_pci_system_reinit()))
>   		goto disable_vfs;
> @@ -257,14 +286,34 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_
>   	if (no_subchecks_can_proceed(checks, num_checks))
>   		goto cleanup;
>   
> -	flr_vf_id = 1;
> +	/* Execute the chosen FLR strategy */
> +	flr_vf_id = exec_strategy(pf_fd, num_vfs, checks, num_checks, wait_flr_ms);
> +
> +cleanup:
> +	for (i = 0; i < num_checks; ++i)
> +		checks[i].cleanup(checks[i].data);
> +
> +disable_vfs:
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	if (flr_vf_id > 0 || no_subchecks_can_proceed(checks, num_checks))
> +		subchecks_report_results(checks, num_checks);
> +	else
> +		igt_skip("No checks executed\n");
> +}
> +
> +static int execute_sequential_flr(int pf_fd, int num_vfs,
> +				  struct subcheck *checks, int num_checks,
> +				  const int wait_flr_ms)
> +{
> +	int i, vf_id, flr_vf_id = 1;
>   
>   	do {
>   		if (igt_warn_on_f(!igt_sriov_device_reset(pf_fd, flr_vf_id),
>   				  "Initiating VF%u FLR failed\n", flr_vf_id))
> -			goto cleanup;
> +			break;
>   
> -		/* assume FLR is finished after wait_flr_ms */
> +		/* Assume FLR is finished after wait_flr_ms */
>   		usleep(wait_flr_ms * 1000);
>   
>   		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
> @@ -272,28 +321,132 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_
>   				if (subcheck_can_proceed(&checks[i]))
>   					checks[i].verify_vf(vf_id, flr_vf_id, checks[i].data);
>   
> -		/* reinitialize test data for FLRed VF */
> +		/* Reinitialize test data for the FLRed VF */
>   		if (flr_vf_id < num_vfs)
>   			for (i = 0; i < num_checks; ++i)
>   				if (subcheck_can_proceed(&checks[i]))
>   					checks[i].prepare_vf(flr_vf_id, checks[i].data);
>   
>   		if (no_subchecks_can_proceed(checks, num_checks))
> -			goto cleanup;
> +			break;
>   
>   	} while (++flr_vf_id <= num_vfs);
>   
> -cleanup:
> -	for (i = 0; i < num_checks; ++i)
> -		checks[i].cleanup(checks[i].data);
> +	return flr_vf_id - 1;
> +}
>   
> -disable_vfs:
> -	igt_sriov_disable_vfs(pf_fd);
> +pthread_mutex_t signal_mutex = PTHREAD_MUTEX_INITIALIZER;
> +pthread_cond_t signal_cond = PTHREAD_COND_INITIALIZER;
>   
> -	if (flr_vf_id > 1 || no_subchecks_can_proceed(checks, num_checks))
> -		subchecks_report_results(checks, num_checks);
> -	else
> -		igt_skip("No checks executed\n");
> +enum thread_signal {
> +	SIGNAL_WAIT,
> +	SIGNAL_START,
> +	SIGNAL_SKIP
> +} thread_signal = SIGNAL_WAIT;
> +
> +struct flr_thread_data {
> +	int pf_fd;
> +	int vf_id;
> +	int flr_instance;
> +	int result;
> +};
> +
> +static void *flr_thread(void *arg)
> +{
> +	struct flr_thread_data *data = (struct flr_thread_data *)arg;
> +
> +	pthread_mutex_lock(&signal_mutex);
> +	while (thread_signal == SIGNAL_WAIT)
> +		pthread_cond_wait(&signal_cond, &signal_mutex);
> +	pthread_mutex_unlock(&signal_mutex);
> +
> +	if (thread_signal == SIGNAL_START &&
> +	    igt_warn_on_f(!igt_sriov_device_reset(data->pf_fd, data->vf_id),
> +			  "Initiating VF%u FLR failed (flr_instance=%u)\n",
> +			  data->vf_id, data->flr_instance))
> +		data->result = -1;
> +
> +	return NULL;
> +}
> +
> +static int execute_parallel_flr_(int pf_fd, int num_vfs,
> +				 struct subcheck *checks,
> +				 int num_checks, const int wait_flr_ms,
> +				 unsigned int num_flrs_per_vf)
> +{
> +	pthread_t threads[num_vfs * num_flrs_per_vf];
> +	struct flr_thread_data thread_data[num_vfs * num_flrs_per_vf];

nit: you can store num_vfs * num_flrs_per_vf in variable

> +	int vf_id = 0, last_vf_id = 0;
> +	int i, j, k, created_threads = 0;
> +
> +	igt_assert(num_flrs_per_vf > 0);
> +
> +	for (i = 0; i < num_vfs; ++i) {
> +		for (j = 0; j < num_flrs_per_vf; ++j) {
> +			thread_data[created_threads].pf_fd = pf_fd;
> +			thread_data[created_threads].vf_id = i + 1; // VF IDs are 1-based
> +			thread_data[created_threads].flr_instance = j;
> +			thread_data[created_threads].result = 0;
> +
> +			if (pthread_create(&threads[created_threads], NULL,
> +					   flr_thread,
> +					   &thread_data[created_threads])) {
> +				last_vf_id = i + 1;
> +
> +				goto cleanup_threads;
> +			} else {
> +				created_threads++;
> +			}
> +		}
> +	}
> +
> +cleanup_threads:
> +	pthread_mutex_lock(&signal_mutex);
> +	thread_signal = (created_threads == num_vfs * num_flrs_per_vf) ?
> +				SIGNAL_START :
> +				SIGNAL_SKIP;
> +	pthread_cond_broadcast(&signal_cond);
> +	pthread_mutex_unlock(&signal_mutex);
> +
> +	for (i = 0; i < created_threads; ++i)
> +		pthread_join(threads[i], NULL);
> +
> +	if (last_vf_id) {
> +		for (k = 0; k < num_checks; ++k)
> +			set_skip_reason(checks[k].data,
> +					"Thread creation failed for VF%u\n", last_vf_id);
> +		return 0;
> +	}
> +
> +	/* Assume FLRs finished after wait_flr_ms */
> +	usleep(wait_flr_ms * 1000);
> +
> +	/* Verify results */
> +	for (i = 0; i < created_threads; ++i) {
> +		vf_id = thread_data[i].vf_id;
> +
> +		/* Skip already checked VF or if the FLR initiation failed */
> +		if (vf_id == last_vf_id || thread_data[i].result != 0)
> +			continue;
> +
> +		for (k = 0; k < num_checks; ++k)
> +			if (subcheck_can_proceed(&checks[k]))
> +				checks[k].verify_vf(vf_id, vf_id, checks[k].data);
> +
> +		if (no_subchecks_can_proceed(checks, num_checks))
> +			break;
> +
> +		last_vf_id = vf_id;
> +	}
> +
> +	return last_vf_id;
> +}
> +
> +static int execute_parallel_flr(int pf_fd, int num_vfs, struct subcheck *checks,
> +				int num_checks, const int wait_flr_ms)
> +{
> +	return execute_parallel_flr_(pf_fd, num_vfs, checks, num_checks,
> +				     wait_flr_ms, 1);
>   }
>   
>   #define GEN12_VF_CAP_REG			0x1901f8
> @@ -817,7 +970,7 @@ static void regs_subcheck_cleanup(struct subcheck_data *data)
>   				intel_register_access_fini(&rdata->mmio[i]);
>   }
>   
> -static void clear_tests(int pf_fd, int num_vfs)
> +static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>   {
>   	struct xe_mmio xemmio = { };
>   	const unsigned int num_gts = xe_number_gt(pf_fd);
> @@ -882,7 +1035,7 @@ static void clear_tests(int pf_fd, int num_vfs)
>   	};
>   	igt_assert_eq(i, num_checks);
>   
> -	verify_flr(pf_fd, num_vfs, checks, num_checks);
> +	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
>   }
>   
>   igt_main
> @@ -899,7 +1052,7 @@ igt_main
>   
>   	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
>   	igt_subtest("flr-vf1-clear") {
> -		clear_tests(pf_fd, 1);
> +		clear_tests(pf_fd, 1, execute_sequential_flr);
>   	}
>   
>   	igt_describe("Perform sequential FLR on each VF, verifying that LMEM, GGTT, and SCRATCH_REGS are cleared only on the reset VF.");
> @@ -908,7 +1061,16 @@ igt_main
>   
>   		igt_require(total_vfs > 1);
>   
> -		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs);
> +		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs, execute_sequential_flr);
> +	}
> +
> +	igt_describe("Perform FLR on all VFs in parallel, ensuring correct behavior during simultaneous resets.");
> +	igt_subtest("flr-vfs-parallel") {
> +		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +		igt_require(total_vfs > 1);
> +
> +		clear_tests(pf_fd, total_vfs, execute_parallel_flr);
>   	}
>   
>   	igt_fixture {

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

