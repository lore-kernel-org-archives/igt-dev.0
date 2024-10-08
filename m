Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FCBCED25F
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 03:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFCA10E178;
	Tue,  8 Oct 2024 03:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4EKjOgt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A900E10E178
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 03:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728357752; x=1759893752;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=egJTm8ivDUMve+Q02oNqjr4HuqK9cu8a4s2TuKozR50=;
 b=H4EKjOgtxp6pav0klxQm5IyenOTXHl0DMxzmpV8kvrBTcGYC2kv1xQqn
 3dfMMNJB5SEfP8bAzC7kKPWR6XqL3t+7jADGtPB7M0eqEly1WDQ01gkP4
 jLnhRPvklNZ4oqVuAEipddGOSZq5eGTRShrmhol9nMrhiZHCyT8Og/AVp
 9Dr4j67Fs+oa3QQse3spm3rsT86KUn5/zTyL+BxLlyM2ygTQ1H6pSR4nu
 9Tf0+nWEAVegx5Gnbm7rHsCuB5NOu8bd7tSWsntGLxVdhlFmb932udJFR
 yLvY5+8Y6xNbJOaA/czNlnEcyRzXYLcb7aGJez0zKykg6gX0BRpOFHx8i A==;
X-CSE-ConnectionGUID: /UTydyk9RY+eldIYHFuvZw==
X-CSE-MsgGUID: GjPqcOMTT5i0FQlbNTSYmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38916914"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38916914"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 20:22:22 -0700
X-CSE-ConnectionGUID: GTdOmdreRIONQoXKe+P9oA==
X-CSE-MsgGUID: hUH+oepvRK+TVFbzQwIV2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="75692639"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 20:22:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 20:22:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 20:22:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 20:22:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 20:22:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 20:22:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joX/b/xKNmJGhO/xAE6+l4VNCI3T+l7vJoLxM8aMqFYrgKJ7B7OngbATfE82Rly10NCJn+u9bauIUO880Hg3vMQTDUBBjsqkTlrLC8R5tfNwdVo1qBSGsx9UOH8YErMjWX1s1WA4CFgYRdJSFLTzuyvkNY3LyZVGe/Odb2JqIw8lRVuXPX/MOEuiEWk0Iu6iZc1KfYMOgZ/FDsNLvhz3hIijQJcL+3i1z0IGqOeE3ALiaJp3AGL6tooUVStCsgpBl0xYKNa0U/bV6DyM2gAWitu6gPsqfAywft47jq4668Z8TY0KJ0NCTW8+Z7yBdMk3UERskdUqNKMN0C0BtybGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egJTm8ivDUMve+Q02oNqjr4HuqK9cu8a4s2TuKozR50=;
 b=ibz0JXhhlttYfG2OpSfYg0HVT7JK01OgBOEQABLWggGd27aYEfLvBHHCcGek8/oE+JhAb6HkXZYbLQUv3RDxCOInTN7xOX3iilEgx9JKsod8WiXZjpObboOFvUw+j5OTSUBMwlV4n5TuIbiXg3axwQ5PdVJlqoX8JXMB2yHIBfQSF0Msk4lUg0SYKVO98nPFWIGBdboy7Bp7sVM/95Oa+MSNUwvpwDqm4b4SY6aYoRoNDxmqUIdUaKzPU7jm4KGkTJ+/GFEQdUNaegAAg+wwEA97atyu+lf8n48mzH1Le5w6dDfoXebOyUtMLpKWzC+O4bdEJGRUsF8nELRUwhWang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA1PR11MB8279.namprd11.prod.outlook.com (2603:10b6:806:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 03:22:18 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%5]) with mapi id 15.20.8026.019; Tue, 8 Oct 2024
 03:22:18 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Poosa,
 Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Thread-Topic: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Thread-Index: AQHbGNsi1gRAhPQv1EqKYxWp4XzyK7J8GVtQgAAVEoCAAAGXkA==
Date: Tue, 8 Oct 2024 03:22:18 +0000
Message-ID: <CY5PR11MB6211966D197F77629AC4C209957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
 <CY5PR11MB62119CD942646EABA7CA5D91957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <cc7c6fab-6310-438d-90aa-d7509f06192f@intel.com>
In-Reply-To: <cc7c6fab-6310-438d-90aa-d7509f06192f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA1PR11MB8279:EE_
x-ms-office365-filtering-correlation-id: 3536a6b8-8a45-46fd-91f7-08dce7486a62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WWxYSU1JaVdpamdiU2VlUmgydHR0cE5qd1JFTnRacW9Pc09TaXc3ZnIzQ0Vw?=
 =?utf-8?B?ZTlMb052bkN5Q2VjbldwYTBPNkU0cFU0Y0NXTnZYZDZWa0FESHRVTGdsVndZ?=
 =?utf-8?B?KzI3QTloL1FPWmFHbXZtREtMRU1kRzczSUZHbmltdUxHQk9IS1lGcmt5WUxL?=
 =?utf-8?B?Z0ZJWFVKVHR1WDFXRWRuTEhoY0NHL3Nibnc3NzloQm81MVdlbkxFWUpOaHVl?=
 =?utf-8?B?RXB3Z2MwOEhKNWZjTnFleXh5OWxEMlZsNHBVQmRaVTNsQk03NUtBVmVsdW1Q?=
 =?utf-8?B?YTZXZWMwQ2tTU21qV0JWWVRpS2Zoc01uWXUrT0xXLzg2YU52T28xZVMwMEVo?=
 =?utf-8?B?eUM2RTdtTFdoL1MzSi95MHV0M3BBVGZrTVlFM04rSkRQeGl0b3FXWUY1NlUx?=
 =?utf-8?B?enlmdlVnSGkyTmNnQmdMSTJMSHBRTjBSeWlQbURzMDB0TjllVGhGQzZwaEUw?=
 =?utf-8?B?ZURoNXVuWnJJTnpjNk5hMlZWYi9zTVlDSFJQdkh4MjdVdWcvaUpCRzAyNWY0?=
 =?utf-8?B?eWJKSmV1ZGFGdVp1a0k1SVVuL2tFZ2IrZ2pJQS95NmFDYi84RU9hd1RUamFL?=
 =?utf-8?B?bDFHN09PMTdadURBOUJrU1c3VDRjZzFxeWJsaFl5dzNtTWIwS3FhWlZRZ0VC?=
 =?utf-8?B?UG44YWFtZnRVLzhvNWs3NDFETGJwUXRRanRpcHI1L3Awa3p0UkpaS2ZhTThv?=
 =?utf-8?B?RWhLaXpKbGNYanVHc29jblkxTWppd2xkZHA0RnpwcTFJbUZOZWdYWWc3VTVB?=
 =?utf-8?B?UVBDQ0JwalBUa1BaK0FEV25nSGVRMlJCZmwxYUFDMnk5SkZTT1RmRzFQU0s4?=
 =?utf-8?B?N2hZUWk5L0hpN2cycHFvRVNPMHlic2xNWWhWU0xQZ2EvTFNTcVZqcEc0aUlO?=
 =?utf-8?B?VmVFTWFERHF4dElPZC9VTjE0M3ZjTTdQZTRodDF4RlBRbGM5N05CeUNuOTR4?=
 =?utf-8?B?MUtjZ3h4TTZxNmhrUGRuQjdxanVRcEpONEhnVTNwa1dIazRjUFhhZ1pSdlIr?=
 =?utf-8?B?b2l0VnpOQW1zb1JnY3RTbTAxSm84S0pGUWtRbkNyZFArYS92UTg5V2VMMzZo?=
 =?utf-8?B?NlpXbDMvRnZJb1BFWWN3TjkrL0JnTzBmSE44cXZ5NHhQTEU0cHA5YzZqTGQ4?=
 =?utf-8?B?SzROdGpodGpKSkUzeHhyM2V6bXNnZ09pT3hDdlpFZDBYdHBBL3d3S20xd1BO?=
 =?utf-8?B?OUJkei9hbXgrLzFTcnRGYWZ4dDF2RG1LYjlxYWxXbFZjQ01oSWsweWRKMHdY?=
 =?utf-8?B?RUxUWU9wUzhqUTIzV2hxdkpRZzg0T3UxMVM5eU1Ddzd1Y3pTcldkZmo2L29r?=
 =?utf-8?B?aDhKTG80N2NxaThoYk1ZSmhCM05vVjB2M0ZMOU15OElHK1dVNEJvUGVvQkI4?=
 =?utf-8?B?Sk00VjdGQlI0NTZKUldnM2drbW5EUlRQYnZVMTVsbGlIWjBUeFFjSVRTMjRP?=
 =?utf-8?B?Y0R0d05mYlF3cUV3STVlTTcyVmIzUno2b0R4ME9LbVJ6aklRZXliV2dXM1NB?=
 =?utf-8?B?WnhEVnpqSEVXMlBaT3R1TDlxUEJYTy96NFdhcDkyYSthZmJkRU5GRnhpSlp4?=
 =?utf-8?B?Ui9jL2hvaDNtaGVmaS9lTU10L2o4WXNWaDFWMi9UaWZlVUdmMzk4VG5tVTU5?=
 =?utf-8?B?eFBZVGdWb0xrUGJBSGd2YnZlL1kyeXNETlZEam5DNi90eG9MNEhLS0JDaWgx?=
 =?utf-8?B?dlVqdXExMlU1K1BGQXF0aVdaeVQ4anZUekVuNnhyakFQdXhkYXhhY2pvODJk?=
 =?utf-8?B?eVFUL1c3UUlpOEdmQW5Oa2ZHWFpScGNhMFNDWDJNT0k2NUhGTnlhaXVmaE5p?=
 =?utf-8?B?QTNMVngzK3p2VEV6K2JmQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVNRRkZGUktTS3JuUFBURlZSby9VTEg3ODNkYnR1WEdYbXF1ZFp2cFp4WUEy?=
 =?utf-8?B?amVrb0h4VEI0dUJsaG1vMVdFMG1FL24xM3NPR0c0NTdySG82b0pKTjBaUnp1?=
 =?utf-8?B?Wk8wYnpFOVlyQ01PQnVCRWEzbXBPVTBON2xmQWxvNnptV0dtYVo3WjlBY3FN?=
 =?utf-8?B?eXlEZTBaakpQVENCQWpiOStob1dSKzYxcTZmcms5dS9wZTd6cXhYWlo0R1k0?=
 =?utf-8?B?WlR3Vko3VWhEQnkrakZPOXJRbGpGUWFCblZYY1ZEVWY3MUJ2bCtPQ254SnBw?=
 =?utf-8?B?ZGFtNkZsV0szeGRLb2QxOHpqQmVPZC95MGZGcEczQk5CVTFvME0wWExwMnhN?=
 =?utf-8?B?OVdjMzYzRCt5czkyS2FtOG5nQUJjVTZaV3BwSXR1WWwrWGRSam5LNUhhU1Jz?=
 =?utf-8?B?OWx0ZG90WnFxU1FDU3NsclFESmpRK3NMSlBZTG44bWRnME1JYkRyVFVMU01p?=
 =?utf-8?B?V25PalNTUXJQUmlncldyNURlRDlXNE54Z08rTktZNWozcDQ4dEQxOEpxNkFZ?=
 =?utf-8?B?YXY1T2QxeXBPYWN3dElqQnJVKzVkdEpuaDlHa05LWDNmMUZEVXh6blVUOXVL?=
 =?utf-8?B?TmR1bjgxMHZpblRoS3ZwL0djNE9rWFhLZFEyT1lzckFiZlhrNnBiNHVIMlNP?=
 =?utf-8?B?cVBkVVVXVlFzS2VIYmpIUXNvR0hrSHF2NGxmQWxTNm0wS282NmVBeDIzV0VX?=
 =?utf-8?B?Tlhia2ZSSHByb1BvOE9oSmk0czUyTTduN0JGN0VjSFZqcWZOdTZTazJaNy95?=
 =?utf-8?B?eDRLUXBXM05WbXZkUHhLZjdhdU82MDdNakczRG5ia29USnh5NTNYQlEyOHR1?=
 =?utf-8?B?YVZodEQrUXV6eTN2UnNPbFJhWk5xcC9mZUFvRFozRFk2aGIwY01JSEcvVVhU?=
 =?utf-8?B?d1NTTTdkdVVCeEh0amhxZTdnWmI0OUl0Uy85bHFQaWFUU1lQUjVmTTU5eUR1?=
 =?utf-8?B?c0RDMDFRdzNTN1c0WThESmxyWEt4M3E5VDdDWnNneHkwTW10bVV4YkdIWnh0?=
 =?utf-8?B?eW1JOWxJdUNxMm11bkk1WTk3N2xtZHJ0U2pvbmEvMnM3dmMrck9CZEJYWHE3?=
 =?utf-8?B?c3lrcndValpzNE5GU2RWRTRqS01wNzhEQzlTQnJSSy9tOTROWGkxTGljM0U1?=
 =?utf-8?B?OE9uMWVTZS9BZjRhTGFpaWRZNHZnRHJKRmp4WTZQTklOZHduTU1WVStkMDQz?=
 =?utf-8?B?bGluZDBiWDh0ZUwrUDN2VU1UWGtPaWxGM3lkRnRvMUx4L1FnYVlNVUNRcks5?=
 =?utf-8?B?cTl3bTFCeGZYbFdtUUZwbCtZcU00QVdSVFJvbTJtemF1OFl6dC9kc05iOWk2?=
 =?utf-8?B?UkpHaHo3cm1UL1IrNXBzK3ZGV3N2TmNacHkzUVJpTTZpOHZWZWVxK1dZYWVx?=
 =?utf-8?B?ZlgxK0ZnaGRXY0JnQTlQYVFYb01vbTQvbk1YcklJR1p0SXJ4RHFzc0FveU5h?=
 =?utf-8?B?SkcrSnY0RWVrVXZZYThDRHV3MDBkL0VZVUR5Ykxvcnh0NSs0ME14Ujlkckhq?=
 =?utf-8?B?VHA0MUZaL01vaURvelkxWFZIU1ZyVHlma3RxTEtGczl5bENFUTF2c0lqVGtU?=
 =?utf-8?B?R0FtKzFhZm9uY1dYa3dDbjQwTFFVVm1XdXFvUGc4ajJyREMzaWkvcldxZ0R4?=
 =?utf-8?B?ZEV4U2c3cStEWWVETURUdHJCSnE5aUFMckNSTjRiWWNFTVFsYTNPZHRqcldC?=
 =?utf-8?B?cmpzMVV2Qno2Rll4ZXRaMWxmZmNXTVVVS0dlZXJ2UlM5bU1DektxUTNxcGdy?=
 =?utf-8?B?TkkvQ0lSRk1pelhuTzhOa0NtaHZ5Ly9WWEk1SHJUR1pvSGNHY2NkeEJzaWRn?=
 =?utf-8?B?ejRGVUhDeDZNSXF6Ty9ZNWVPMzViNGtQbjVCbmg0MWg0eTg2WVp0eGlnbFlM?=
 =?utf-8?B?VjFlaXZmbFJaMzJUN0QwRWhtdExlVXZDUjMzMmUxbXZVWWhmWFF0Ym5VVVla?=
 =?utf-8?B?SVF1VnhNMU0yRThVMVp6K2MvcWE4Qlh5MTdOTmlaRWlaRyszMmo1azVnUjBK?=
 =?utf-8?B?VXFjZmN1Y2F2VjEycnd4Z0dZUjdxMXdHdXFLc3doYnZqS2VyMHIvU0lvYmpI?=
 =?utf-8?B?K1N4LzZLQnVLNmJReElSd2d0RTF1cWVDSW9qbW9uRzB2bmNORTVtQUxjWUVY?=
 =?utf-8?B?TEE1WkN5NUhHMUpjK09JR1RrMElYZUorR1NnSERMR3JHVFdlM2VGbUMwVFlm?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3536a6b8-8a45-46fd-91f7-08dce7486a62
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 03:22:18.8044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBt2cz2o7v6abhHo0qY3V3UTZaxJTZdsFkG/dMPTJv7QsQT5UlH5IzkY5qIaAK5oagfnlbJ0VLM5ydoYL2WxMqo2xdU2FVfr26UE8Qz2VCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8279
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2hpbWlyYXksIEhpbWFs
IFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2Rh
eSwgT2N0b2JlciA4LCAyMDI0IDg6NDQgQU0NCj4gVG86IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVt
YW4uZ3VwdGFAaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBOaWxhd2FyLCBC
YWRhbA0KPiA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+OyBUYXVybywgUmlhbmEgPHJpYW5hLnRh
dXJvQGludGVsLmNvbT47IFBvb3NhLA0KPiBLYXJ0aGlrIDxrYXJ0aGlrLnBvb3NhQGludGVsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCAxLzJdIFJldmVydCAidGVzdHMvaW50ZWwv
eGVfcG1fcmVzaWRlbmN5OiBBZGQgYW4NCj4gYXNzZXJ0aW9uIG9uIE1JX1NUT1JFIGV4ZWN1dGlv
biB0aW1lIg0KPiANCj4gDQo+IA0KPiBPbiAwOC0xMC0yMDI0IDA3OjMxLCBHdXB0YSwgQW5zaHVt
YW4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
PiBGcm9tOiBHaGltaXJheSwgSGltYWwgUHJhc2FkIDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50
ZWwuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIE9jdG9iZXIgNywgMjAyNCAxMDo1NCBQTQ0KPiA+
PiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4gQ2M6IEdoaW1pcmF5LCBI
aW1hbCBQcmFzYWQgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+OyBCcm9zdCwNCj4g
Pj4gTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBOaWxhd2FyLCBCYWRhbA0KPiA+
PiA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+OyBUYXVybywgUmlhbmEgPHJpYW5hLnRhdXJvQGlu
dGVsLmNvbT47DQo+ID4+IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29t
PjsgUG9vc2EsIEthcnRoaWsNCj4gPj4gPGthcnRoaWsucG9vc2FAaW50ZWwuY29tPg0KPiA+PiBT
dWJqZWN0OiBbUEFUQ0ggaS1nLXQgMS8yXSBSZXZlcnQgInRlc3RzL2ludGVsL3hlX3BtX3Jlc2lk
ZW5jeTogQWRkDQo+ID4+IGFuIGFzc2VydGlvbiBvbiBNSV9TVE9SRSBleGVjdXRpb24gdGltZSIN
Cj4gPj4NCj4gPj4gVGhlIHJlcG9ydGVkIHRpbWUgZG9lcyBub3QgcmVmbGVjdCB0aGUgY29tcGxl
dGlvbiB0aW1lIG9mDQo+ID4+IE1JX1NUT1JFX0RXT1JEOyBpbnN0ZWFkLCBpdCBhY2NvdW50cyBm
b3IgdGhlIGRlbGF5IGluIHRoZSBzY2hlZHVsZXIuDQo+ID4+IFRoZXJlZm9yZSwgaXQgcmVwcmVz
ZW50cyB0aGUgdGltZSB0YWtlbiBiZXR3ZWVuIHhlX2V4ZWMgYW5kIHN5bmNvYmpfd2FpdC4NCj4g
PiAgIGlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3luY29iaiwgMSwgSU5UNjRfTUFYLCAw
LCBOVUxMKSk7DQo+ID4gZWxhcHNlZCA9IGlndF9uc2VjX2VsYXBzZWQoJnR2KTsgZWxhcHNlZCBp
cyB0YWtlbiByaWdodCBhZnRlciB0aGUNCj4gPiBzeW5jb2JqX3dhaXQoKSB0aGVyZWZvcmUgaXQg
cmVwcmVzZW50IHRoZSB0aW1lIHRha2VuIGJ5IHhlX2V4ZWMgKw0KPiBzeW5jb2JqX3dhaXQsIHRv
dGFsIHRpbWUgdGFrZW4gZm9yIGNvbXBsZXRpb24gb2Ygam9iLg0KPiA+IFRoYW5rcywNCj4gPiBB
bnNodW1hbi4NCj4gDQo+IA0KPiBUaGF0J3MgdHJ1ZSwgd2hpbGUgd3JpdGluZyAidGltZSB0YWtl
biBiZXR3ZWVuIHhlX2V4ZWMgYW5kIHN5bmNvYmpfd2FpdCINCj4gLCBJIG1lYW50IHRvIGNvbnZl
eSBpbiBiZXR3ZWVuIHN0YXJ0IG9mIHhlX2V4ZWMgYW5kIHN5bmNvYmpfd2FpdCBjb21wbGV0aW9u
Lg0KPiBXaWxsIHJlcGhyYXNlIGNvbW1pdCBtZXNzYWdlIGJlZm9yZSBwdXNoaW5nLg0KV2h5IGRv
IHdlIHdhbnQgdG8gcmVtb3ZlIGFzc2VydGlvbiA/IFdlIGRvbid0IHdhbnQgdG8gd3JpdGUgSUdU
IHRvIG1ha2UgQ0kgaGFwcHkgaXQgaXMgdG8gY2F0Y2ggdGhlIGJ1Z3MgaW4gS01ELiBFdmVuIGlu
IHRoaXMgY2FzZSBhcyB3ZWxsIHRoaXMgaXMgYSBidWcgZnJvbSBMaW51eCBLZXJuZWwuDQpJIGRv
bid0IGFncmVlIHdpdGggcmVtb3ZhbCBvZiBhc3NlcnRpb24uIA0KVGhhbmtzLA0KQW5zaHVtYW4u
DQo+IA0KPiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMuDQo+IA0KPiBIaW1hbA0KPiANCj4gDQo+
ID4+DQo+ID4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgOTI4MjVlZDcyYmU2MWM1NDE5ZDk1ZGI5NDRm
ZWYxYzlkZGEyMjE1YS4NCj4gPj4NCj4gPj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJv
c3RAaW50ZWwuY29tPg0KPiA+PiBDYzogQmFkYWwgTmlsYXdhciA8YmFkYWwubmlsYXdhckBpbnRl
bC5jb20+DQo+ID4+IENjOiBSaWFuYSBUYXVybyA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0KPiA+
PiBDYzogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4NCj4gPj4gQ2M6
IEthcnRoaWsgUG9vc2EgPGthcnRoaWsucG9vc2FAaW50ZWwuY29tPg0KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkNCj4gPj4gPGhpbWFsLnByYXNhZC5naGltaXJheUBp
bnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIHRlc3RzL2ludGVsL3hlX3BtX3Jlc2lkZW5jeS5j
IHwgOSAtLS0tLS0tLS0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkNCj4g
Pj4NCj4gPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3BtX3Jlc2lkZW5jeS5jDQo+ID4+
IGIvdGVzdHMvaW50ZWwveGVfcG1fcmVzaWRlbmN5LmMgaW5kZXggNzcyZmU5YjU3Li5mNGQwNTg4
OWMgMTAwNjQ0DQo+ID4+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3BtX3Jlc2lkZW5jeS5jDQo+ID4+
ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3BtX3Jlc2lkZW5jeS5jDQo+ID4+IEBAIC0xNDQsMTUgKzE0
NCw2IEBAIHN0YXRpYyB2b2lkIGV4ZWNfbG9hZChpbnQgZmQsIHN0cnVjdA0KPiA+PiBkcm1feGVf
ZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2UsIHVuc2lnbmVkDQo+ID4+ICAgCQkJICAxZS0zICog
c3VibWl0LA0KPiA+PiAgIAkJCSAgMWUtMyAqIChlbGFwc2VkIC0gc3VibWl0KSk7DQo+ID4+DQo+
ID4+IC0JCS8qDQo+ID4+IC0JCSAqIE1JX1NUT1JFX0RXT1JEIGdlbmVyYWxseSBjb21wbGV0ZXMg
d2l0aGluIGNvdXBsZSBvZg0KPiA+PiBtcy4NCj4gPj4gLQkJICogQXNzZXJ0IGlmIGl0IHRha2Vz
IG1vcmUgdGhhbiAxLjIgc2Vjb25kcywgYXMgaXQgd2lsbCBjYXVzZQ0KPiA+PiAtCQkgKiBJR1Qg
dGVzdCB0byB0aW1lb3V0IGR1ZSB0byBzbGVlcCBvZiAxMjAgc2Vjb25kcyB3aGljaCBpcw0KPiA+
PiAtCQkgKiB0aGUgY3VycmVudCBwZXIgdGVzdCB0aW1lb3V0LiBDdXJyZW50bHkgdGhlcmUgaXMg
bm8gd2F5IHRvDQo+ID4+IC0JCSAqIHJlYWQgdGhpcyB0aW1lb3V0IGZyb20gSUdUIHRlc3QuDQo+
ID4+IC0JCSAqLw0KPiA+PiAtCQlpZ3RfYXNzZXJ0KCh1aW50NjRfdCllbGFwc2VkIDwgKHVpbnQ2
NF90KSgxLjIgKg0KPiA+PiBOU0VDX1BFUl9TRUMpKTsNCj4gPj4gLQ0KPiA+PiAgIAkJc3luY29i
al9yZXNldChmZCwgJnN5bmNvYmosIDEpOw0KPiA+Pg0KPiA+PiAgIAkJLyoNCj4gPj4gLS0NCj4g
Pj4gMi4zNC4xDQo+ID4NCg0K
