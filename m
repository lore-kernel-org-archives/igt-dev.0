Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7E4C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFEC10E92E;
	Thu,  6 Mar 2025 09:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khct5W79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A33510E928
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741255000; x=1772791000;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rlSFRez3PMSNcgC76MZkiugpin0jgzjpO8569iD804A=;
 b=khct5W79D0kYFKt3r6sEnUydMDqrgPXPWwT8fvlOuTc1MEInLCVS6tHc
 IwPQ6xnV2YNLcYRCm4lYl0SSWaO3yzP6zoUermd8z7t9Pp0q22ttdA4ep
 zCHpS43jS9pBhQjmqrOWQdPHeV7DDv9QBBObfLoUWjKaf61cL8KOW+CmB
 zn68r7h6Fbn7YbpeG9xw9CHKBQMfp15p8ucnBHHqkWPO2WpyciLtWh9sm
 QzEEZ4XUZgFmzI13Hlmh5UejAM0Gl53WgixyzOt+dsqFtD9odSFIJB2zn
 WPDPybKDvQxdvB0i611Klrsv/ELl15eZI57nn3JBkSqgRp/rX+kAnryhl w==;
X-CSE-ConnectionGUID: VVQ+xd0TQ/6A8kN0GRE/RQ==
X-CSE-MsgGUID: jUIrTUwcTkCMvnZy/5qi+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42393338"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="42393338"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:56:40 -0800
X-CSE-ConnectionGUID: /O5+vilWQ1+J1vCJCgvRoA==
X-CSE-MsgGUID: amW6KqcdTQKBUzKykoF1Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119500361"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:56:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 01:56:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 01:56:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 01:56:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gL2rXVQx02Rg1HpVnegtwv/BQIzBuzDeMwDAlLgykdKvKrc3OGD5x4oGN6XALqCyIH7eELs5QB/E8z8bytYHFz7LmNc/pb6ZUPceHq5kdXTlz6mEq0MK9TJNkhb43E78eEBkktt+8c12eM6NNyYSio6c+7AYvB0+38W2h1WjdB5Okfhc2NTPVPtahAxVImC4B2D/wdC0CIlgvYmygXrLRRQ1ZLLN6qvTIXQRaDWDJMpRKHHJNnaWgLl6o4bdMePCScNcDB9AD0/klw5PPlrWf1w2ma8w4DSOlyAeIlhkjuivroG81Z8MwmqjvVFbRB+Eo6cnTzXk82ZZgUGxuz/pBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlSFRez3PMSNcgC76MZkiugpin0jgzjpO8569iD804A=;
 b=ROewQhOLLJN4dsQsZ8OigyszmrFjeeB7aOjMN/ELB9QjPyFmn4A7aWEhOSC+Hl/XzK5a6hqxtEpTsDpYiCAFQQbmpbiCQzC7FhfbJz+vHSbSAi4cTjpcfQQfGzfMrZSKollC/TBK2Sek8LRTyve8FJxS61Ca4/hFEOQM2Cyb2vnb5NmBCN4CnoawuQF14FrABhAAn90BiQWvfmpnE4+7aIUXo19B2koaALpQAl1wlCei82619QAz91ZiYuEmnwPn9G7q4tJvfr40a8hNnYGGih4UDWYU0+m3YxhgETqL0pjGbBjDfcV0cLVeEuJmY5nmzUkT2cxnu5CWIR+Q5CtnLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 09:56:37 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 09:56:37 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v2 3/5] tests/intel/xe_fault_injection: Add helper
 functions to inject fault with specific budget parameter.
Thread-Topic: [PATCH i-g-t v2 3/5] tests/intel/xe_fault_injection: Add helper
 functions to inject fault with specific budget parameter.
Thread-Index: AQHbgp6jFPL8FVkYvkyCOBAKbBgdd7NkbWYAgAGJVsA=
Date: Thu, 6 Mar 2025 09:56:37 +0000
Message-ID: <LV3PR11MB8695449BE5A273A7640CBFA5F9CA2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
 <20250219073445.31423-4-satyanarayana.k.v.p@intel.com>
 <Z8gnPWhK0seaPf08@fdugast-desk>
In-Reply-To: <Z8gnPWhK0seaPf08@fdugast-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|DS0PR11MB8763:EE_
x-ms-office365-filtering-correlation-id: b2f97d0a-4c60-4fdc-c989-08dd5c952f68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MFBYaXJsNXJoSjhuMnBldXl1R0tvOUN4VlNZbXBPRDVYbWRhSXBqZEM5cm1h?=
 =?utf-8?B?RjA3RzR1T0V2NnIwdWtEdDNPa3hlZEhsY2JUd1FVNXcyZTBpb2p4TFpiaHly?=
 =?utf-8?B?d1ZSYXBlcy95a05za2RVdEdjcFNNODU5UURVMXpkNmxwUHo4QXh4aFdCZlFk?=
 =?utf-8?B?cGI1SmpRQStuYnFGN0l0Q1p5a0dEREwrQm1XMVM0YWNHZ3V2cEZ5a3llYzZ0?=
 =?utf-8?B?VzFEY3g2TWFsV2VackJMekppSm1LUWdHQTQ3c2cvdXNEUzNleEFvTUdUbTQ1?=
 =?utf-8?B?M0djaS9RRXZRcXczWi9HTUpLVEZJck5VaWE2TGFmRVFQT2w4VTlzN3ZOeUdN?=
 =?utf-8?B?Q3hRREtOeEU0Q0g5SFQwUzRvaWdyZlAzYnlKZ2gvUVhVTHJ0d3NnMmVqNWIr?=
 =?utf-8?B?S3h5OHNROUZLWFZzQmdNL0txb1FWT21Geit4R0Z3ZjNTY1o1MEVlYlJWOU93?=
 =?utf-8?B?NlhFdXFrS05RVGlxN09uYlRLRGFiK2Z0K1BOaHZRV2ZUN0xvVlViNDZZRVZh?=
 =?utf-8?B?cThvK0lPNDltNjJkOUwwNDA3TWxJTEUvRi9zdytrQlBwcktaRzN0T1NzVnpp?=
 =?utf-8?B?d2ZnNXNMak13aGw0R2lqTXNTSE5zd09UU3lpUDd0TmVwTFMxaXF1bmVPSnRx?=
 =?utf-8?B?RkRYWmZOU2I3WVhJYkVvSDFVbkRHZ1B1dmMzMU1vdXREZitEMU1PVEdmcE5P?=
 =?utf-8?B?WHM0VHFMMlh5V3p3TG00Zmx3cUJ5MFBVSzMyNHJzVjhuamU2bjJscnJUNjg1?=
 =?utf-8?B?RnYySm8rZVBmNitFcjdLUXJ1YnpSVVpJd3dGb2dFWE8yR1VxNWxiVHR2Zmx2?=
 =?utf-8?B?YW5STVlUd3U4SVRHOGFlMlZWakJJVDFQVjdNNG9HRTZPNjFRYVl4Z2FnK2RZ?=
 =?utf-8?B?QW1Na1IzTStpTjhuODNGVXdLcUYzWXd0R3JNL3hCdktPcFJqT0NHelZoWXNk?=
 =?utf-8?B?NnRTME5tb0JPaGdlNGVKd25uNVR0MEE0Y2x4K3pJdVJMNm5XczVxQ2FCYkl3?=
 =?utf-8?B?Y04wa21NNXJUNWxDVHBhbnEwWGFLM2JxNFdEdWFhaCttbEJUdzlablZ6TXdM?=
 =?utf-8?B?K2toa09nMVpQWmJpUklCTFFoY0lMd04wQmRSWWV5RnJQNjdwelAxWXdTcUVu?=
 =?utf-8?B?VUtZOFpZbXBPbWoxTmxDVXAxWVg2UDNZQXVLSWtVVFF6MzNPendkT29OOStE?=
 =?utf-8?B?TFhCVExQbXAxZ25FS0NxNW90Y2FIWWpFcHBmRDB5dnVkaURPZVRRNWxRZjFI?=
 =?utf-8?B?MHEwSUJFWEJDMXRMNlJxOVdWNjNMdGJDK00vV0NUOUdpY01HMUhlYzBDY3pX?=
 =?utf-8?B?VlBjUk9tQU13V3UvUTFqc2Q3Q2VBNUxoNzNYbm8zOXpvaFc2VkRPUGxlZ08y?=
 =?utf-8?B?MUNDMndkRVlLcE9PS3lvVzlRKzNYSDNEbnN2OFYvbE1MZjRWZFVreU1mUCtZ?=
 =?utf-8?B?L2QzcnlWS1EzK002QjBwQVlWOVJ2VHVDcDh0SkYxbVRDYXN5elIxSU5mSEpu?=
 =?utf-8?B?M1RYUmxCNEJOMXpFZjk1ejRsRUh2RWtVbFRaWDlhcVFLMmhWblJyRXpjSHkw?=
 =?utf-8?B?Zk1VazRMNnlQcU9MQVVlYUNxeXVhWU9WVjZtS2R4WThIY09yc2FZeElpVFRX?=
 =?utf-8?B?MjIzWCtvSEtVampaQm5CblIxQjJFK3hPazZCTGkrRzYzV081L3pscGNBcXIy?=
 =?utf-8?B?RWhBa0NhR1VMVnh4a0lwbzZueXN6QnZjVHFxalppWUZGcGRTNTlubk4zbmg1?=
 =?utf-8?B?Z0ZWKzhRdWRrTjBTdU9HSHc0a2dDV3NFSmswLzN3UHVuUlBGU3Qzc2l6ZGJs?=
 =?utf-8?B?dlg4OGFsS3V4bUdEUjNxTTlUcUhPNGFLOTlMdCtWVzFYQlR0a28yVlFzNmNH?=
 =?utf-8?B?VlNjQTJKQjJRbGFBbFEwYWtYb3NxQ0xFZEprWHVFa2VKVFIvanJpUzNzUGRP?=
 =?utf-8?Q?uaOQrfhArOS3wgJpH4PG4Q3EZ6xpZJ0s?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlFaS1dZU0R6eGprT294aXBkQlZRazUvV3dqVDJGU05sazVpcWVuQkR4MHU4?=
 =?utf-8?B?Q1ovU1lLS3hhQ3N3U0ppTURYUFJSOTlNamxBSVlpTDdtNURmNG94c2N2dytE?=
 =?utf-8?B?b1BtNERHNGhZc1ZmSHhna3pueVFGVlJrNkRjZDRUVStIS2ZRbWhqcTFXMEZS?=
 =?utf-8?B?dUF0VzZOMElKK0xhYjcvbWJYdm1PZ1lMbnZBY1ZQc3RNaDlwQmNkTHRXc29z?=
 =?utf-8?B?WHlvTmRXWGJDT1J0dzQ0ZkZvdXJRRGIzU1BCRklNMGRnS0Ezd2t1emhndjU3?=
 =?utf-8?B?WW00Y1Z1ZWlaZzdaNzZHS2Vnck9EaTFRQ3ZENjE3dGVmZ0o3bGpOTzhodENo?=
 =?utf-8?B?N3A0czhjYitBOXRPWVFCQkhEYWw4b0xvd1ZuMmtGRnJtdUpUTGxhbnAxVjFs?=
 =?utf-8?B?MVhLY0NiakdXd2o5U0pYMitQY3R6d2tPVWtrL0c1aEJiM2dIZTBtS1MxS2pw?=
 =?utf-8?B?REZpdDJrajNRQmZISHFjdmFFWGwwcGRaUGF5aXAyeEFXcXF5VmtSVmtuNCtL?=
 =?utf-8?B?VFJPQS9FNVJTL0hudTVVaHBMUjJHMUc3Yk00cG9CNlpYNGdqdGxxNFQ4allJ?=
 =?utf-8?B?WmJzQWVlMGIrVi8xWEVydDdFL1pFQ2g2V2ZncGdTOEgzTEIwdmN5WlZIVENB?=
 =?utf-8?B?dkZpbVViWTN2b3Z4aUdlV0did3V6RzJFTlBzY1NwZktBUU1YSGlQNHRvdUhU?=
 =?utf-8?B?VHg0UkxKUWErSmd3RnJyRUpJOTM0ODlzNVQ5bHlwWVJzVERUUFBSdlVTVDJy?=
 =?utf-8?B?V1ZOek5EOFBJbHBhY3RMRzY1c3RUVjI5a0RER1FDazJ6Mk9HN1FNZGduYi9X?=
 =?utf-8?B?bXV0VEFKM1lDejdCcHdLTk5NTkJacnpzNjlwN2Qza2xOY0liQ29ZNGd3VFJz?=
 =?utf-8?B?SWFqU3F6elhlQk9HUDdjVHFkblRhS0pyZFVVaFJaeVFZUEdjdnFVNERGS3VZ?=
 =?utf-8?B?U0M1TmVKakxKQlZJM0F1YVVETGJvNExJaVloeUJxMVp6Ly85ZXpyTThmUGp4?=
 =?utf-8?B?UE8vT3JIMi9aRXRPZzh5ekp3SUpFVzI1dVhGakdJanNyeVQvdGZLS2Z5UXVD?=
 =?utf-8?B?TGtNNDd1NEUzT0FXL1FDd3RxbDJjRDhvbzcweE5abW45Y3djOTVwMkIzQWJQ?=
 =?utf-8?B?azdGZnNMWS9WUlEvSzlOWHJLeXUwMEJ3T3dhY0Fqd2FNdHBjVE1NSWh1cmdZ?=
 =?utf-8?B?bStKMjIzV0YzM3R1ZEQxZEpNKzlHQjhNaGVwWXUwek5Hc0lQdFE4MXdQcGdo?=
 =?utf-8?B?K1AvM3JRYU01T3JBMVcvTDRqNWFzOGdxMndyOUdLTS82enkyaElhRE1GLzBW?=
 =?utf-8?B?dTVoUEdGemg2K2xUYTdoVWVETjFQM3BKdE1xL2wxRDZaQ0xWcStjcDBRWTJB?=
 =?utf-8?B?NERCdjFndmJMZTUrRFNsK0dYQUh5Q1Y5MzA4ZUVtdHdDNERSbzNGOC95aU1M?=
 =?utf-8?B?V1Eram1tSE95N1orQWQ2QXEzN0FtQnBya3RCWlRBbG5TQTl3amRqSjdJam9x?=
 =?utf-8?B?a0NYbnV1R0RtbGdsSkVvQVh2WUhRTXY1WGU4Y0d5bWJoK0hFZzhXYnF1YXJo?=
 =?utf-8?B?OFV2SnR4WXRKTW96SmVGY3Z4bnY2WVhnUHZDUG9jYkdBZlR6QTRmS05xTGJE?=
 =?utf-8?B?MUtxWUY3N09FNTJCNDZnRVA2WGRTYWEyaXhtcEwwUUk4WG5teURLRWtOVTZB?=
 =?utf-8?B?b2NhQllTRlJDSEVhRzlwKzNtTGlIc1ZrRlV6MThnSkY5OHROU1BpUFVwVjht?=
 =?utf-8?B?Q0x4WXZaV2FFZ3ArbDJHZkJHNkMvOTMwRzdqTzJTcWI5Mm5vRno1NTBOQzFs?=
 =?utf-8?B?UjQxZkZ2UDVQUDk5WGt6aFBwQ2NtaktNL255OHpzNnpDa1owNGxZSjBBZlRS?=
 =?utf-8?B?UTd3dFR6b3ZrenFZMGNSMWk0QXA4WXZqamFla2ltcnQ0VEM0a2FNc2M4ZmJV?=
 =?utf-8?B?UWw4YXQvWDFMSXI3ZnBpTjRFYk4wcG1CWStpVFJTdkZaZjJzSEpTdU53T3ow?=
 =?utf-8?B?eWRhMDlTSlYwRW5jd2U4bGdkbDJtTlZSbGxESTV5QnRsalAxVHFNNDcyRzY2?=
 =?utf-8?B?ODU5aFN0a05IZTgrZVNDMFN6cTZybzRSazdTaHhqRHJGR1RrY3NnNW9adFpR?=
 =?utf-8?B?QUk1SVk2ekVUZWpsMVd0MFh0UXdON2pGUS9WV1M2blpLYnZ0M241U3Zhc3Yx?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f97d0a-4c60-4fdc-c989-08dd5c952f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 09:56:37.1494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4YIZ8q+D4oKwqFi+JC+Yzl/PKMEoVm7krcg0Qq1LkI443Htdz5HU7gBrunrkuRVg3RE/sb9IqT7vr/rGRWRwhYskcTFm1jxt3ktc4yE+6UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8763
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEdWdhc3QsIEZyYW5jb2lzIDxm
cmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDUsIDIw
MjUgMzo1OCBQTQ0KPiBUbzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEuay52
LnBAaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdhamRl
Y3prbywgTWljaGFsDQo+IDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBpLWctdCB2MiAzLzVdIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbjog
QWRkIGhlbHBlcg0KPiBmdW5jdGlvbnMgdG8gaW5qZWN0IGZhdWx0IHdpdGggc3BlY2lmaWMgYnVk
Z2V0IHBhcmFtZXRlci4NCj4gDQo+IEhpLA0KPiANCj4gT24gV2VkLCBGZWIgMTksIDIwMjUgYXQg
MDE6MDQ6NDNQTSArMDUzMCwgU2F0eWFuYXJheWFuYSBLIFYgUCB3cm90ZToNCj4gPiBBcyBwZXIg
dGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHRoZSBmYXVsdCBpcyBpbmplY3RlZCBvbiB0aGUg
Zmlyc3QgY2FsbA0KPiA+IG9mIHRoZSBlcnJvciBpbmplY3Rpb24gZnVuY3Rpb24uIEludHJvZHVj
ZSBhbiBlbnZpcm9ubWVudCB2YXJpYWJsZQ0KPiA+IElHVF9GQVVMVF9JTkpFQ1RfSVRFUkFUSU9O
IHVzaW5nIHdoaWNoLCBhbiBlcnJvciBjYW4gYmUgaW5qZWN0ZWQgYXQNCj4gPiBzcGVjaWZpYyBm
dW5jdGlvbiBjYWxsLg0KPiANCj4gVGhpcyBtYWtlcyBzZW5zZSB0byBtZSBidXQgbm90IHRoZSBj
b21taXQgdGl0bGUuIFdoYXQgYWJvdXQgc29tZXRoaW5nIGxpa2U6DQo+IHRlc3RzL2ludGVsL3hl
X2ZhdWx0X2luamVjdGlvbjogQWRkIGhlbHBlciB0byBzdGFydCBpbmplY3RpbmcgZmF1bHQgYWZ0
ZXIgeA0KPiBpdGVyYXRpb25zDQo+IA0KPiA+IElmIHRoZSBlbnZpcm9ubWVudCBpcyBub3QgZXhw
b3J0ZWQsIGFuIGVycm9yIHdpbGwNCj4gPiBiZSBpbmplY3RlZCBpbiBldmVyeSBwb3NzaWJsZSBm
dW5jdGlvbiBjYWxsIHN0YXJ0aW5nIGZyb20gZmlyc3QgdXAgdG8gdGhlDQo+ID4gbWF4IG51bWJl
ciBvZiBpdGVyYXRpb24gZGVmaW5lZCBieSBJTkpFQ1RfSVRFUkFUSU9OUywgY3VycmVudGx5DQo+
IGhhcmRjb2RlZA0KPiA+IGFzIDEwMC4NCj4gDQo+IEkgd291bGQgcmVtb3ZlIHRoaXMgcGFydCBh
cyB0aGlzIGlzIG5vdCB3aGF0IHRoaXMgcGF0Y2ggZG9lcyBhbmQgY2FuIGJlDQo+IG1pc2xlYWRp
bmcuDQo+DQpVcGRhdGVkIHBhdGNoIHdpdGggcmV2aWV3IGNvbW1lbnRzLg0KLVNhdHlhLiANCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEu
ay52LnBAaW50ZWwuY29tPg0KPiA+IENjOiBNaWNoYcWCIFdhamRlY3prbyA8bWljaGFsLndhamRl
Y3prb0BpbnRlbC5jb20+DQo+ID4gQ2M6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0
QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9u
LmMgfCAxNiArKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0
aW9uLmMgYi90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+IGluZGV4IGJjMDU1
MTVhOC4uMzI3MzNmZWM1IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2lu
amVjdGlvbi5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4g
PiBAQCAtMjUsNiArMjUsNyBAQA0KPiA+ICAjZGVmaW5lIElOSkVDVF9FUlJOTwktRU5PTUVNDQo+
ID4gICNkZWZpbmUgQk9fQUREUgkJMHgxYTAwMDANCj4gPiAgI2RlZmluZSBCT19TSVpFCQkoMTAy
NCoxMDI0KQ0KPiA+ICsjZGVmaW5lIElOSkVDVF9JVEVSQVRJT05TCTEwMA0KPiANCj4gSXQgc2Vl
bXMgdGhpcyBsaW5lIGRvZXMgbm90IGJlbG9uZyB0byB0aGlzIHBhdGNoIGFzIElOSkVDVF9JVEVS
QVRJT05TIGlzDQo+IG5vdCB1c2VkLg0KPiANCj4gPg0KPiA+ICBlbnVtIGluamVjdGlvbl9saXN0
X2FjdGlvbiB7DQo+ID4gIAlJTkpFQ1RJT05fTElTVF9BREQsDQo+ID4gQEAgLTQyLDYgKzQzLDIx
IEBAIHN0cnVjdCBmYXVsdF9pbmplY3Rpb25fcGFyYW1zIHsNCj4gPiAgCXVpbnQzMl90IHNwYWNl
Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgZ2V0X2ZhdWx0X2luamVjdF9pdGVyKHZv
aWQpDQo+ID4gK3sNCj4gPiArCS8qKg0KPiA+ICsJICogIEludHJvZHVjZSBhIG5ldyBlbnYgdmFy
aWFibGUgSUdUX0ZBVUxUX0lOSkVDVF9JVEVSQVRJT04uDQo+ID4gKwkgKiAgV2hlbiB1bnNldCB0
ZXN0IHdpbGwgcnVuIGZvciBJTkpFQ1RfSVRFUkFUSU9OUyBpdGVyYXRpb25zLg0KPiA+ICsJICog
IFdoZW4gc2V0IHRvIDw9MCBvciBtYWxmb3JtZWQgLSBzYW1lIGFzIHVuc2V0Lg0KPiA+ICsJICog
IFdoZW4gc2V0IHRvID4wIGl0IHdpbGwgcnVuIHNpbmdsZSBuLXRoIGl0ZXJhdGlvbiBvbmx5Lg0K
PiA+ICsJICovDQo+IA0KPiBUaGUgZnVuY3Rpb24gZGVzY3JpcHRpb24gc2hvdWxkIGJlIGJlZm9y
ZSBpdHMgZGVmaW5pdGlvbiwgbGlrZSB0aGlzOg0KPiANCj4gICAgIC8qKg0KPiAgICAgICogLi4u
DQo+ICAgICAgKi8NCj4gICAgIHN0YXRpYyBpbnQgZ2V0X2ZhdWx0X2luamVjdF9pdGVyKHZvaWQp
DQo+ICAgICAuLi4NCj4gDQo+IEFsc28sIEkgZmluZCB0aGUgZGVzY3JpcHRpb24gaW4gdGhlIGNv
bW1pdCBtZXNzYWdlIGJldHRlciBkZXNjcmliZXMgdGhlDQo+IHB1cnBvc2Ugb2YgdGhpcyBuZXcg
ZW52IHZhcmlhYmxlIGFuZCBmdW5jdGlvbjogIi4uLiBhbiBlcnJvciBjYW4gYmUNCj4gaW5qZWN0
ZWQgYXQgc3BlY2lmaWMgZnVuY3Rpb24gY2FsbCIuDQo+IA0KPiBGcmFuY29pcw0KPiANCj4gPiAr
DQo+ID4gKwljb25zdCBjaGFyICplbnYgPSBnZXRlbnYoIklHVF9GQVVMVF9JTkpFQ1RfSVRFUkFU
SU9OIik7DQo+ID4gKw0KPiA+ICsJLyogUmV0dXJuIDAgaWYgbm90IGV4cG9ydGVkIC8gLXZlIHZh
bHVlICovDQo+ID4gKwlyZXR1cm4gZW52ID8gKGF0b2koZW52KSA+IDAgPyBhdG9pKGVudikgOiAw
KSA6IDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBpbnQgZmFpbF9mdW5jdGlvbl9vcGVu
KHZvaWQpDQo+ID4gIHsNCj4gPiAgCWludCBkZWJ1Z2ZzX2ZhaWxfZnVuY3Rpb25fZGlyX2ZkOw0K
PiA+IC0tDQo+ID4gMi4zNS4zDQo+ID4NCg==
