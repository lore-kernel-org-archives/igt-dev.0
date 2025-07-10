Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF45FC83F09
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 07:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691CD10E892;
	Thu, 10 Jul 2025 07:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWV/O424";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F5B10E892;
 Thu, 10 Jul 2025 07:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752133128; x=1783669128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=egKvKLuyFN6Q0Qfr9iwPeLCmE8KEYXpX8Q6lpohwXjk=;
 b=gWV/O424L/3IeIrbzUo+emaUhfnIo3fNjZ1ivOSoguFSdCUugJK9dq2+
 3Dp6w94giYPDqOqofGhHOUgh4GLdlg2ltFPj1vTY0zc4MHmrI4eE4csr2
 BGg3WNkApMXe/6XyD+0YuJGxc6k67dF3Vgym1DJqa9LV0DrDhD7naL0pq
 mGdYEzOjr6VcFIZ4dDKkPJr0JC3y4c+0OB9l+m1L04l7PmujZ3NqOOdBa
 bLdmBOBxScFbFmkUAnerNWLSOnyGxK7DZW+hkSoYvsex0ZYiknDyXjlkH
 lgKTHvwYPRQYyTjaMpVuoWSgIN0CpOwmgB338CEatwp98yCWNSMg/bEh8 w==;
X-CSE-ConnectionGUID: ruvxusSYTQq9UdrCzHeiEA==
X-CSE-MsgGUID: tNrpkzCvQO6pmDfzScy+mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="71990296"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="71990296"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:38:48 -0700
X-CSE-ConnectionGUID: kOWsnvOGTteVl4iF44ArRQ==
X-CSE-MsgGUID: 7i7cFZAwR/i5Hv8Tf59e5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160286755"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:38:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 00:38:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 00:38:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 00:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqEh0M03D1BcZmIb/J/1WNa9sVypXcGWqw0lZYd0/mcJjpdPzpoStPdRnRyzvoc3UWJbQ7ja2EAtUaBdFr4nOP0OJB7lwJG/qelNjC2nPnYStl6JX8mVRv52fm9oYrmZKRXkQMwCWjvEYImDrrAfjPrKKkU+bR8Op7WSQwufPEZKYKt7yDdtSKmnG6OySzueI35cpxFj773aPEpPINXVnmn+ElQFW56OpXLJKtKtxSgNc2/d+hK19wWj6Qs6uygkODCqi5zbU62fERdvkO76Nz5cOxGx1EAV4V1uNsudNOB50k4yfZrbh8fzvpq00H7HR10gj8KHDoKsVl2keP1uWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egKvKLuyFN6Q0Qfr9iwPeLCmE8KEYXpX8Q6lpohwXjk=;
 b=thwxWEkox5yq0p1Ry7sTUMagQsX2EVpiQObhFARNB+YtDVrWPmbqtgj2KQipsS33sbk3WPW9oCGFErw/I/S7BMZw1JJCtsu1/8NwZfU8n81jKCOvxX1ekZSuKp/GiR5AXRvBXl88JGJdStezRlIgWcoZ4s+DWeCEHVOTH1/HgIZu+rsgVOgNTYxU2H4k+i58CP6xRMYe5dbyeZyZ4RGnnuOo6QAp0FRKUySEoHaYeudonPqc7LHi9Q4+u6oL3yqoa1L2ZmfwgHZFxzzkkItpALye4zLyT1w3W8DEmi+BRgsAlHkt9jJoNzn+TVycBA8hdrdXWwtBguFTnFu5Iozn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 07:38:17 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 07:38:17 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgcnVubmVyOiBSZWxh?=
 =?utf-8?Q?x_timeout_reduction_on_soft_lockup_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBydW5uZXI6IFJlbGF4IHRp?=
 =?utf-8?Q?meout_reduction_on_soft_lockup_(rev2)?=
Thread-Index: AQHb8KlNsHbqgjgwXUW9Tj/T2O4jmrQq9MTA
Date: Thu, 10 Jul 2025 07:38:17 +0000
Message-ID: <CH0PR11MB549100608C943034695692BAEF48A@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250708130437.917619-2-janusz.krzysztofik@linux.intel.com>
 <175200737579.145757.3823429970788938737@1538d3639d33>
 <1972516.6tgchFWduM@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <1972516.6tgchFWduM@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|SA1PR11MB6566:EE_
x-ms-office365-filtering-correlation-id: f5ec6b9f-3645-4c98-d831-08ddbf84bc8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|13003099007|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?VkpNN3ZQNzNlRXA4dGRDOTBkNVZ0L3JuWjJCT1g3bWNWVEVKaGZ2UlVaWGpj?=
 =?utf-8?B?dThPUjlUbUpyZnFtOUl6S215eURHOUY4ZFVLQkJhSVZQcWNqVmJqUHdaZTJo?=
 =?utf-8?B?bGVVNFgzbVZpMWlhRVdlRlZEWlZoL2NueXZLYWUxRDRIVGIwcEI1MUdIVlh3?=
 =?utf-8?B?eEdVZGpPYkhEQ1lOOGhYTldTWEZRT29SdzFteG4yTjRqSUJmL2orWkd3YXAw?=
 =?utf-8?B?YU9paFB1Q3FwaHM4OGpWeVBwYjh5aWgyYTF0ZHR1ejdVUGdRUjNMME5Vdloz?=
 =?utf-8?B?VWJKeVhNS0NSUE93TkF5TVlrUmIzWVJlMDBJT1YzRjRpaWpOdjgvbkdyblFr?=
 =?utf-8?B?ZkdnNWxJZlpUb0NRbnZ1K3l0VDMzWFZWT0xaOCtKa3pUKzEzNi9Hd3RWVGlt?=
 =?utf-8?B?S0xkWkRZUDdjU28vcWJLTnZQU3NSYTB5MS9BeGoybmZzb29LTVBPVEw3aUly?=
 =?utf-8?B?WUtlZ2g1N1NkWUQyd2svbjIwMzI0Y2hSVVNoelZTbzErMWNHSWhyREFCd1pT?=
 =?utf-8?B?djZFSVBuanhYYkIxUXg3YUc2MzRleVh3SVBqSDJLdU5wbkkycTdwd1hmczM2?=
 =?utf-8?B?SktoVEozNEdwT1YxWnZlQitob0l0bTY3WjN6ZmlsaC9vOTZ4ZWFWWnV6eXFL?=
 =?utf-8?B?VVdQZFNlcSt0RVJxRG8yZ1lJQXlFaUJwYVVWRTNxNUdZSTVDZFNhTlNEMVNJ?=
 =?utf-8?B?eGdQbnFzUFRNeW5DakZrSnk1TEFPNEVwcDMxaGVuTmFIL05kZnVJNkhuRysw?=
 =?utf-8?B?QStXWTVYU1dzc0VSZm1SYm1xRWhNblc1RmI3N2ZMTmRXbzNoSnFxdzhHQ2Qw?=
 =?utf-8?B?eEJtODloZnhOWUxnejN0NHNIc1pGVG90cU5uWjBRL0VJQVlMTXFXTzdzdmp5?=
 =?utf-8?B?TURHWVF0VEhhTkVzaTluRThFSUkrdlhHZGY1ZHZQZ1lKbjlHYjBJeUVzNFVr?=
 =?utf-8?B?WWtXcVdhUEM5QnNQWnB0UGlFbUFXK0hGNVVydGhOL3dFOFpwVk4xOWV2WnI4?=
 =?utf-8?B?QkovWis2ZTZxV3BleFhKUEVqWWJWR3dFOEdXSlJPL09tVTNybSs2R0ZzcHI4?=
 =?utf-8?B?bjQrTTdONFE2UlVqLzlVTUJLRlI0dlowaGhIMi9EYkNMVHVjUlV6NENOTXhF?=
 =?utf-8?B?WVordEJ4TEM2MlIyL1lsM2hJK1hHeUVkdnh5c0dMUmNSMWVhTERDOEpBNE9L?=
 =?utf-8?B?anNIV1lNa1BKVmdpNi9jOGtmK0dhaTFsMFhOZnA1REl4UHIxZExDWmRkVTMy?=
 =?utf-8?B?aVFyNjI5U1VCK29FalFBbVFkYnpaVUNENUJMandxUVFFQ0FMWVBKQVg2SWFU?=
 =?utf-8?B?Qzllc2ZiQ1Z6NkxvYkxXZkJrK2hSU0R1YTZzQldqaUs3RzVLRDhxQXNZM2V3?=
 =?utf-8?B?a21WQkIwem44blNKNlRaYjRYVXpxblFrRlQrODd0anluREZlM1htWlovSWVZ?=
 =?utf-8?B?UzVEWmRxeEMzYy9kazNqb25ValdkZEpEdDM2TDIzV2kxQ21qeEppQkNldzFy?=
 =?utf-8?B?ZjJ4ZUlZU2pTOXkzcUZNdjJyZzgyd2d1UFNuOU9Sd2N0MkdFNnY3eTRoTzFD?=
 =?utf-8?B?a0lqSVo0TXBSY1hBUjllWEl1WE4rM1VaU0RoZXdrTHRPQXlKNjZJTmpvZ2o5?=
 =?utf-8?B?TFNCMGZBWCtWeHMyTzNGVXpnRFJ2aUtGWFdWUWV5dkEvYzQvQVluUEJheVh6?=
 =?utf-8?B?c2RJczVzdnRac3d6OGhiQkh5YkJrZXRuZEc0dkFzcFdQbERBdEVxRU10SHNJ?=
 =?utf-8?B?U3ZReWFNRThHcFZCc3Nmd3JPVTdwcUJIbjRqS05NZ1M2blp2Rnl1MU9EYmJs?=
 =?utf-8?B?RlFlb3phVDdUWldqQy92V1cxWlZENzdPZURjRU9xNERuaEJoa2w3MG1MNUtM?=
 =?utf-8?B?MDROeTNlcnBwYnlBQkE5NmFBa0E5bFVHdWpuWGNubUthMEFaNzUwdGF1ZUFR?=
 =?utf-8?Q?RLAknI5/Ih4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ymg3cEsvc1pIWjF1TFlsM2RRUjdYZktaQ1Erc0hrYmZ4MEVOeHpjcDNQMEJQ?=
 =?utf-8?B?V1R0TUpWa0l2cGs2WmhQd3R5K2lsV2hYTTQ5VU5MTjRPVEY3dXkrZFN0UzdV?=
 =?utf-8?B?cCtHMVB1SytveDdmR2NvWHE2UUtURUd2RmJwTjBxR01SWDlFdTlZbmhUV2NK?=
 =?utf-8?B?b0Freno4VmtkNHpXK3FUa05BblA2UmRqWFJYK1VVcTRpc2NQRnhVK0dBR25o?=
 =?utf-8?B?bkhodG0ydi9BUUYrME9WRk42eWg0RG0vNWNFdjEwcEgxRHlxMDlBdXBIM3pO?=
 =?utf-8?B?VjZoK0RqUTVWb0NTNW5nRDVnZE01dWRQelRxbGJPN3Y2UkdBMVdxOVIzSWMz?=
 =?utf-8?B?c0t0R0liRTBKbzJyVHlLeXhWL3FxNytLa3lpaDNwamNzOG11ZUpTYU1ZSE1p?=
 =?utf-8?B?RnVzUGJzbGxVS2ZsRXlSWHI0UFYrQVJ4ZWp1Y292Q3V0Zi80MklKdC96ckVj?=
 =?utf-8?B?TWhCcEQ4Z0xwUWw1NWRuK2dmL09pcjRybUNYS24xNzFLdUJPYmZaQVp2RlhY?=
 =?utf-8?B?YkFhOHNUOXBJYjJpaFFMbnZWZG9CSE9yTDFHZklnd0VScUZVa08xUW5Ub0pj?=
 =?utf-8?B?QWk5T3NpcFVGVCthVTJMWGlnV2ZSZER3Y0lmVGp2eUo1eWIyMWp1cmhOb01K?=
 =?utf-8?B?bW5BejA4K1BSOFlMeE10T0JTai8wclBnZGJ2Ti9rV0czTzBETUV6cE1ET1Zr?=
 =?utf-8?B?eDlpWFpDWVM0RUh2WDcyL3NkS1l6M1czdXd0RGh4a01nMFVyVUthSzRFcHdF?=
 =?utf-8?B?VW5EcGUxWkVOckpuT25hWXl4cHdwcVlzOU5JZGkxQnZGSVlGblRPMTJmVGhT?=
 =?utf-8?B?ZGhDOVp1bTFmMXpoSVZUd0FURkI3bkptWnhxd2JGeEUvejAvY2hXbnc5bXgy?=
 =?utf-8?B?dmh2ek1nVHozNnZRQ0xWUU5JZWJoMW9QbFgveWQvMnNtaXJBQmswUWNEWFJ0?=
 =?utf-8?B?a3hCNFJEUXlKUXllQ0c1WEZZNUVWZktVWVhxb3VXUmhBUy82dW9POXZ5REdr?=
 =?utf-8?B?ZnpUQ2dQdWpjUzJWa09PSCtiWUxCSVVQeDR5dFVtSktqb3pCS0p1aTVEcFJj?=
 =?utf-8?B?citqUGhsd3FmSWV4OXVRcTdrRVh1MlhhOFBPT2paa0FsRGw1RFlBdGNaeXBa?=
 =?utf-8?B?MmVkYVhKRWtTUjV2RFhybUtPVWQ1SE05WUxjYXVGd3N2eElqTWFQMGpQUUFr?=
 =?utf-8?B?eVB3TUNGMG5jREJhWlEvcnlpYzh0aEYyTUpvWW12NlplZTBiVURqT05jMkhY?=
 =?utf-8?B?UEZVdmtwWDNYVXFmMTBpS2dTcW9jMll3ZTFaNDJQRk1NRkZwdk5LT3ladjVI?=
 =?utf-8?B?TVdtb014cTR6RXZtZE10UWZQTEFrU2hXZlc3MU03QUxHaHNPU2lxM3BwUWgx?=
 =?utf-8?B?VzBjaC9XODg1UWluZEtCeDlHb2ludkNucEVDT2wrY0w5a1FuTG9NZkFFMVdZ?=
 =?utf-8?B?eXBqWU1YL2lCR201elZjMU5kaGYvV3dndGtDdTRLSEIzdVYrdXNycTNvTTZS?=
 =?utf-8?B?c292Qm0vdWpTdkhjLytXbi8vMGNEN1l6dnFuc3NHZytTMVJBVlhjVTdqS214?=
 =?utf-8?B?OUszZXJEdUtZL0dYYVFQV2NENGhUQlkyTUp3ZlE4K2R0eTUxZ3o5aXVGZFFN?=
 =?utf-8?B?VFh2SldVRU9VWGFDSktXQ2hYQk4yNTMvYjZJSmMvNmZVV0pwRGtibG9ReUdO?=
 =?utf-8?B?K0pVVEprOUpxR3VyOEorNEVMeC9LWHdTVDRWRHRxdHdFdmRHMlArZDJUWUhU?=
 =?utf-8?B?QkFUVko0KzJGb25DRUVUejBsV2dzL2l5YnhzRy9Bc2kxQ0hVVFlTdHNjMFJl?=
 =?utf-8?B?bEp2d3pmZ0RBWkJLVklyaXdWdlFTZEY5WjFyb3FZVE1BbDVpUTRkelB0a2FO?=
 =?utf-8?B?YVppclVzKzJFVEwzZHdoSmVrZCs3Nzdwd3B5VmRJd01VNW9nQmJ4bmFUbWJB?=
 =?utf-8?B?Wk9tVlZGck0zV1VPdGRLbEtTd1JSQ1dLR21od3pLMFFTN0N2UHJyZFY3Q1k5?=
 =?utf-8?B?NENobmYyRk9tZDZJc3dkL2ZXSHEwUUNaN1NibDhxa1hEL3ZWcHVUbHQxdkRY?=
 =?utf-8?B?c0pZcC9mOEVRUDhVQjhHMk53eVdnUmo3QTRmd0xqOFRZVGJqcnFpOXV1ckdj?=
 =?utf-8?Q?3YEl9E78Bp5TnPBTJf8sAksMs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ec6b9f-3645-4c98-d831-08ddbf84bc8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 07:38:17.6245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wpOVS0h2tyc5tlIq0q9wZoL9dTtA3ykdpVv95F1HQ8JzJbOb81RFpspokzFj5a7vuTlXJv2mXg0sPId2spv5SXz6ldhVLj560zybmobTis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6566
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

DQpIaSwNCg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTExOTAv
IC0gUmUtcmVwb3J0ZWQuDQppOTE1LkNJLkJBVCAtIFJlLXJlcG9ydGVkLg0KWGUuQ0kuRnVsbCAt
IEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fubm90IGJlIHJlLXJlcG9ydGVkLg0KDQpUaGFua3Ms
DQpSYXZhbGkuDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZy
YSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxm
IE9mIEphbnVzeiBLcnp5c3p0b2Zpaw0KU2VudDogMDkgSnVseSAyMDI1IDEzOjQzDQpUbzogSTkx
NS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgcnVu
bmVyOiBSZWxheCB0aW1lb3V0IHJlZHVjdGlvbiBvbiBzb2Z0IGxvY2t1cCAocmV2MikNCg0KSGkg
QnVnIEZpbGluZywNCg0KT24gVHVlc2RheSwgOCBKdWx5IDIwMjUgMjI6NDI6NTUgQ0VTVCBQYXRj
aHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHJ1bm5l
cjogUmVsYXggdGltZW91dCByZWR1Y3Rpb24gb24gc29mdCBsb2NrdXAgKHJldjIpDQo+IFVSTCAg
IDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTExOTAvDQo+IFN0
YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNo
YW5nZXMgZnJvbSBJR1RfODQ0NyAtPiBJR1RQV18xMzQzMSANCj4gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0t
LS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2Vz
IGNvbWluZyB3aXRoIElHVFBXXzEzNDMxIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlm
aWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdl
cyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4g
SUdUUFdfMTM0MzEsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlz
IG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBD
SS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMzQzMS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5n
IGhvc3RzICg0NSAtPiA0NCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0K
PiAgIE1pc3NpbmcgICAgKDEpOiBmaS1zbmItMjUyMG0gDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNz
dWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24g
Y2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xMzQzMToNCj4g
DQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMg
IyMjIw0KPiANCj4gICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAZ3RfbW9jczoNCj4gICAgIC0g
YmF0LXJwbHAtMTogICAgICAgICBbUEFTU11bMV0gLT4gW0FCT1JUXVsyXQ0KPiAgICBbMV06IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzg0NDcvYmF0LXJwbHAt
MS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGd0X21vY3MuaHRtbA0KPiAgICBbMl06IA0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEzNDMxL2JhdC1ycGxw
LTEvaWd0QGk5DQo+IDE1X3NlbGZ0ZXN0QGxpdmVAZ3RfbW9jcy5odG1sDQoNCkNhbGwgdHJhY2Ug
bG9va3MgdGhlIHNhbWUgYXMgdGhvc2UgcmVwb3J0ZWQgdG8gaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xNDM2NSwgcGxlYXNlIHVwZGF0ZSBm
aWx0ZXJzIGFuZCByZS1yZXBvcnQuDQoNClRoYW5rcywNCkphbnVzeg0KDQoNCg==
