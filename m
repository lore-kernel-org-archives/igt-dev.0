Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D4BC54E71
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 13:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B75188C11;
	Wed, 21 May 2025 13:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5fTedrk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425EA88C11
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 13:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747833414; x=1779369414;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+CNTyVQFfv64xY5DzpkggVq7wJlLuQP0s0rtnsgNmBo=;
 b=S5fTedrk8LPRqRmYdPNgjJypL1HQ2DAl5/kIgmPlKNcqAiothX4rdlz9
 Dd1+B+0QZI/7vhGKCxaIX9z2fMYwkSyYGdWCcMIuiiBKSRODVVMHq/79/
 1m0v2LI+SbN+rLLkQElzoDv41LJvMPUkiSynARmrbXTQ/ReCvjZOkPsso
 xJF4HM0lF7pMN8ywzseWp2cW+lfsWP+H90RjwKs0DI9HkyBSjbseNs0F7
 ql4dxLlEY6Y6Y24UC0bAOfXHiwPzLuZ4v3DC5bWE2SgJjaKbcEr+3yNYH
 GUxLK9L5yxbUfQzasVjMxwdC0EwmkaE/f1E8Ep7oKEHheYQwcni8bZVRB g==;
X-CSE-ConnectionGUID: n3Vb7RqRRFeFK/QvFytYAA==
X-CSE-MsgGUID: ccO+J0fAQqWiEW4qBQRd/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49906855"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49906855"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 06:16:08 -0700
X-CSE-ConnectionGUID: xIOAdh82QJGovBfoOKrWdA==
X-CSE-MsgGUID: x1Wl9xYiQ4WOX1widKH2ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="171065479"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 06:16:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 06:16:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 06:16:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 06:16:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3Tn0rveyrlXJaXI9LzQvcFTClwowmhDDjYXlVTZHw4yE/d41yNjQZxpeOiGhWuLWKYm6ksVxl5LvlflFRsZnnmoXJktZrusDRCsJBPUOrwI6+M3UhmzM1x+X7A3+zfDxCiKhcoX71MrQXWIAnwSM8gIDhBbtUffgRdMLUOjl3m+mOH1y4PRticlXynYa85afWDfFR9QpUgqu/j1E+c6IOk4N2HEvfZDrKheVt0mPw/OAScV6vm0yiPn02etH7jLdC0ORwwIaEtyf24l1o8NzKMUhTZQ6Uu3fEr0JqSOslN9mkLz3yhjz7bBn2sdu6ro0OVp3DM5IDCeLE5/38vSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CNTyVQFfv64xY5DzpkggVq7wJlLuQP0s0rtnsgNmBo=;
 b=cFUByNYLIKG5VMDOrOlpJsqjs9pk74NeFh4PC6ZyHRMTzCC7IIPzzPY3PWY2HQlTk6iM0ZGnouALpoowCVO3gqBcXOWbXKlj+3oUeY2VJ+/RlH0KNLLYEIzVFtJpULfrLG3Ca/ofVFAk4c4UEF6IgknBYlaP9Xc0OZJh/K6rIpxxk366O6HxyD4U+5+ZDi/nj7kOL3RvzgCfFIek8OZGytsbuEv/XJvJ0kj9paRrwKVdiMEFa0EDyS/k/IkTUItddS5kmvFXpaEnpLOS5LEopSKRFthxAid04t4B+E3Fspn9gQUcl4/Eb5+Nk/k/yZEFOJzoyIzyaw8Rq6YnWa2fGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 21 May 2025 13:15:34 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 13:15:34 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/kms_plane: Fix crash on fail
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_plane: Fix crash on fail
Thread-Index: AQHbykpV8xi5yx1HKUaXy06tE7uf4LPdEDKA
Date: Wed, 21 May 2025 13:15:34 +0000
Message-ID: <MW4PR11MB70547B8E3D640F5EA8A65280EF9EA@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20250521121641.32384-1-juhapekka.heikkila@gmail.com>
 <20250521121641.32384-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250521121641.32384-2-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|DS7PR11MB6176:EE_
x-ms-office365-filtering-correlation-id: 0312133f-f367-4b72-5262-08dd986991cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ejBDcld6NU9tUkpBVG04V3phSU40V3lISnZRU0RmaExRckVybU1nMEd4NVgx?=
 =?utf-8?B?Y2pUcGlPV2tZY2tkRzV4M29UakFuSVVlV0dJQ1RoQU9MR1o4TVZrMmFqTy9M?=
 =?utf-8?B?RDBqeGhSQ3R1MzR5M3IwNzJjWjByZ01YVG45R1Y5U1RWVGxNY3VURURGVGtG?=
 =?utf-8?B?Z1NYVkRPTVRaKzFFbTlDM0hidGRURUxmUldHS0JDZTQyQlFpY2ZOaE1TMWdu?=
 =?utf-8?B?V29ZcVFDZFlvdjdSUnJIeVp3UjZsSHFvZVRzSVZTeXVNc3diVG1odUJWeFFN?=
 =?utf-8?B?R0IxU2E0Q09wVHFGYUthcTJ5YXRHZXg1UlpKU3J6VTg3NjFmalYwTXp5TkZK?=
 =?utf-8?B?bEljczJjVWdnd2U2a1AyYXdtcDBvWUhIcnpoMFh2ZWFTd1ZDdi9pWnZwMWRR?=
 =?utf-8?B?ejg1TVo0ZitGQzFrYXlvdFpCYkt2NkowdGs5TEJ5ZWx1cno4bm1LU1gwbncr?=
 =?utf-8?B?ayt5NTljZVdTT0dBRm9xQ3diKzZVYzlvdE1ka1BlbURJcTRObmxjeE45M3NM?=
 =?utf-8?B?NVZvMkVBdVZUUFdETm5DQzBVNWVTZXNKeEVDNU81VUhDNVFlNkxkSDN1dzBm?=
 =?utf-8?B?OUdMczQwNEVwRHRBMjd1T3BSU2E5bWFCRDJoc1NQK2hlM05LUEl1OTJ5dlRt?=
 =?utf-8?B?TXdQdVdNNnc5Q3g2ejhuNEZ0UnYrRlJnR3NQU3MxanNEOXVrbGpHSG53K3dZ?=
 =?utf-8?B?QU5MNDBpUnFzaVVaSFY5T2pHWUtMVU5PYUlGVXEzNlhScDNkSFpFSFlMR1hY?=
 =?utf-8?B?MkhueGZJNEtpTWxiR0NCTC9vMTlsOWZlRk9RdXU2TlpZM2pmWVhsUEU0c3Na?=
 =?utf-8?B?SmJxMmNxZUF4Z0NqZFNDVnpXNWxCb0ZXZGZUeHBOaCs3QXhKMXdvMHE3Rnkv?=
 =?utf-8?B?eU1HZDJIc0pnK2V0WGthZlhUbndMOWJGTmdUdnZySUMvSGV4aG5iVUFtWmZs?=
 =?utf-8?B?a0hTMHROdktFaXROUS9WbHgvZk56ODJnc3VyZ2YzTWRwTlgvb25EZWN0MHJx?=
 =?utf-8?B?c3V0WFJORThvUjM0OEZwWmV2YWliOGdaWjlhelk5d3djZVhob0xjSkFndjgy?=
 =?utf-8?B?Zm5rQU9GTlV5ajNhQ1hDWElCTG9KaHJ0aEYwbzZ5MGQzeFlwSlp6eC9wWlpk?=
 =?utf-8?B?TUl5ek1jN0JEU3BwSkJVQjNLaSs1ZHR2U2wrRkxwOGZ4UEl6dWlvK21BTGp6?=
 =?utf-8?B?LzdZTXpBeFNDOWs4SnFHQ2pRWm9MdmFQMWtSb000eFNvM0Y3TmtvTWs1WnhY?=
 =?utf-8?B?Q0lCQ0dQd0JwMERUVUUrNW9zSjVvSFJKY2lEa1ZGQy82UnFHdmY1b3hJcU9K?=
 =?utf-8?B?WmlQalQ4c1k2ZE1TS0JoOG9vWlcwcFVjVGVyY2VZd0MzTm10eW04WklWaitn?=
 =?utf-8?B?dWZUdTdzTUZ0T1NZeCswcGpRaVNsbmJLODFVcDhYTURTV0FlWUozTndlelp1?=
 =?utf-8?B?T2wzWWV6WnZ5YXpvMW9aQWd5a01BM0pLUC9jb0tTZi9wMkgyV0dpTEJIVkJF?=
 =?utf-8?B?NzFURlZ1NC9yOHFnSzV5di9yMmJjZXdtY0poWTZhSFhTaTlQVkg2b3EyeWJV?=
 =?utf-8?B?MHhKeEhwYlpYVnJkcDZqUnlQK1ViVnlJY1JzZTMwejQxVUd4NCtvUGFmOTJu?=
 =?utf-8?B?RU1JRTFFS2k0Z0ZWVUpHUCt5ME5tV0R5ZDlDNGpyOGJ2dmFkeUhDV2NEVUJE?=
 =?utf-8?B?UTJLSmpDcitXYllCdk1DNk5XU2ZZaEs5N1JGbjVMV053Tktjbm9jNytOekN0?=
 =?utf-8?B?ZVVFRm96MTloS01BaThBbG9md2hCbGQvNHVoNmNCVXJvdWFJa29KWTJudEtE?=
 =?utf-8?B?REFZWHFlMkVPQkNCT3hxLzcxeVFCMmNzZ2Nkd2ZZVjBtVGxYOTVXSmIyWjNi?=
 =?utf-8?B?c2RjakdUK1NvMGtlOWNpdXYzZE9HZ0kxUUh5eFZzR0RoaDRVMml0VkpnL0pp?=
 =?utf-8?B?T1NyamRsWWMxZ3BzdFlYOUh5VjNSNTlDODZsWFFtZEQybkxGNlFwN2NoUDYr?=
 =?utf-8?B?MHFCWkw3dDB3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2F3Y3dTSFJLeStPczc0WUh3K2pBMWZQVWRxbWFmS1RMQ29MUCtBeFZoTitt?=
 =?utf-8?B?T1N1SmhjbFRyYnV6OXgxOVc0L0UvZjhsdytvWTZwYmJlK1BobW42RW51dytW?=
 =?utf-8?B?dmFLYUJlSy9sQTRDeDRYM3BnQlZvZEJGTzlvUGJqRVlpS1o2cDJ3QUZkOG5j?=
 =?utf-8?B?dThOQzVTNmxSVjRKK1ZzMkZzd29FbWJRUzRCU1ZxdFozNDFNZ3VQY21DamN3?=
 =?utf-8?B?Yk9KcXU5UDl2QTk1anlFZUpWaThFUmYwb2hGTnFHV2tDQmttaDFjVis0WCsv?=
 =?utf-8?B?L0F2YXJyK1RpWXkydm54YmtOTUZBaUlTV1JicCt5Y0FDZXdDQUhPcFBxTENN?=
 =?utf-8?B?V1JXOTZsWWpPTW80OFlYa0p2VXNKUlhjdllHaE4xdVl1MjVRL1Zwb2VpOWQ5?=
 =?utf-8?B?cVFVQ2NzUHBtTEI1T3YyM0VNdVEvOGlhYXgrNjhld0N5NU43QTh6RUpTYndS?=
 =?utf-8?B?eTB1c1c4RjNrNVhEVVN0bGtwaFRCUGI1Nld6cUxVN0kyYTNoUkNtTlY2VHNT?=
 =?utf-8?B?SS9BcjMwODRKc2RqMWh1RzhXbWdET0xBR0Jxd0N4NHpyV3JHY2xhekZXOFc1?=
 =?utf-8?B?VmFPYjE2MmFIZ3RqWHlRbHlEd1MzUCtZQXBYZWwxZ2pxWlpCMkNtczg5QnYv?=
 =?utf-8?B?MXFNajN0U3RvTk10MWI3dDRvUkMyME9ncko4ZWZPbTJOWGZSbWM0UjRvRm5Q?=
 =?utf-8?B?OTNZdDdNZm9LSUFIbjRhT3RVTy9EUWovOVVnVDZqMDAyV00xYnFkZ1YwUUQ2?=
 =?utf-8?B?SVVkL09rSWpDaENPelVjMUxvVnJNb0pDQVk1YXVRVjN2ZGNNanVTQTlXUmlu?=
 =?utf-8?B?c1Y1QXdRbXgranlGbUZTMEJaOGFrdFRBd1VhSUZJZmR5WnpVUVU2L0pNMFRu?=
 =?utf-8?B?SytWRkxLajlvNzVrbkpkMWk4cUw4b0VHL0R4aEFtRjRLaDVuM2xWL0hheUdP?=
 =?utf-8?B?ajNxd2JOM0Z4Z25uek8wY3RUcXBlNHQ2amtYcGxRcnpLWHg4TXp5MmlUaTYz?=
 =?utf-8?B?dHVLTWc1eElIWXRBOXNpM0cxaURLLzhmYXY1Z2phdnpzYVVEWWR5dG55dGcx?=
 =?utf-8?B?RUlpUG5VbE11bGRJNlZIbUZRNDEvNm5WNWlkelZoazd5QWVYVFRFMWpiRjFX?=
 =?utf-8?B?TnRtVFMyWVp2Z3ViMndlTHJneXJqSUZQeTRyd01YUkZyMVY0SGFQbWR0aHJp?=
 =?utf-8?B?U3AycVlyeEhxNUNxV1lsc0g5aGZTWVRFZnliUGJGSjBRRHlSSXErWUs2VmIx?=
 =?utf-8?B?UnlLK2RPK1pQQ1ZwYTUvTGw4Y2ovay9wY0pPaklocko1MlFKenlxRGpNTER5?=
 =?utf-8?B?MUVJV2l3dUlQditEa2xhVWxTTFZpdm5FYkRNWUI1S2pPODhDcGFZOVBCZUtV?=
 =?utf-8?B?WDhxbDZ6b0RNVE5mZjNxcjhFc3doSzBFOE1jUmlOZWF5YnJwVE8wRXNkN2Ni?=
 =?utf-8?B?anIyNG1pcWpNcng2dkxBQ05ma1ZKSEp4ZGJDNzZZWlNkYVBicVRzYVlDQTZr?=
 =?utf-8?B?U1YrcHFxZVM3Y1I1OFJFMGNaTmQvaU9ZMFVqQUdEY3ZCckc5UEV5MG1HSTBW?=
 =?utf-8?B?eHZSZXowWFozeE1CMTN0T2ZOSG43UFRIYU1YMCtVOGNocmdHSENuMjhYN3Yw?=
 =?utf-8?B?SENUaXVKQ2FySnFEMlAzK0RuV1hqemRBOWZpZnBJUkZHKzRINEluc0M2RXNm?=
 =?utf-8?B?eGJ1dlJ3Z09SVjgyUGRzM01NbE80Y2lTSmt4eFdXMFE4cXF6ODJlZzZ0dnVU?=
 =?utf-8?B?ckJXakwrWWdnMHBYNlg0Zk5BSklkUHJ3NElwVVVlTEdaM1FlQXN5dHE2eXFv?=
 =?utf-8?B?SktEeUQ5VDVvNjNmaTVaU0RrNWVTdk1MQTd6OCtrTmJUR1NudjA1dlFlbVhD?=
 =?utf-8?B?VnRBWk1JNkN4RWU1WVlYMVlpZ0hLa0EvRDQrL0R0eERzOWY5NFdDeUQ1TVJo?=
 =?utf-8?B?bUQ0QXNXYmFDZXdkOTB1UTYwbmF4Q1Azb21hWkMvSTNwaTNZbkcxM3VTRFdl?=
 =?utf-8?B?KzBqQytOeFluOG5vc3BUTWhwYXc4TmF0aGNHY2dIWUpaK2hTUzJyWkpzNFJm?=
 =?utf-8?B?S2tBQmlaQW4rZ2srYmRzLzNpSm9qSmtHQ0N3SVNrWlNRcUQvSHRYaVZCZGpU?=
 =?utf-8?Q?iodn72uwbwq4tYdzc1T+EtHK6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0312133f-f367-4b72-5262-08dd986991cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 13:15:34.1728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLa3n11WI4Jte1pnlvfeKVw0SuvVJJ14DvR88pr3/ZFiXtAwVLNMdVszOSAngkHhY1MMK1yyEk76CXzM0p/1LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS1QZWtrYSBIZWlr
a2lsYQ0KPiBTZW50OiBXZWRuZXNkYXksIDIxIE1heSAyMDI1IDE1LjE3DQo+IFRvOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBl
a2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IDIvMl0gdGVz
dHMva21zX3BsYW5lOiBGaXggY3Jhc2ggb24gZmFpbA0KPiANCj4gUGl4ZWwgZm9ybWF0IHRlc3Rz
IHdvdWxkIGNyYXNoIG91dCBvbiBmYWlsdXJlLCBsZXQncyBmaXggdGhhdC4NCj4gDQoNClJldmll
d2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1v
ZmYtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+
DQo+IC0tLQ0KPiAgdGVzdHMva21zX3BsYW5lLmMgfCAxNCArKysrKy0tLS0tLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS90ZXN0cy9rbXNfcGxhbmUuYyBiL3Rlc3RzL2ttc19wbGFuZS5jIGluZGV4IDI4MzFi
MmQxOC4uZjdiNjcyYzdhIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9rbXNfcGxhbmUuYw0KPiArKysg
Yi90ZXN0cy9rbXNfcGxhbmUuYw0KPiBAQCAtMTAyOSw3ICsxMDI5LDcgQEAgc3RhdGljIGJvb2wg
c2tpcF9mb3JtYXRfbW9kKGRhdGFfdCAqZGF0YSwNCj4gIAlyZXR1cm4gZmFsc2U7DQo+ICB9DQo+
IA0KPiAtc3RhdGljIGJvb2wgdGVzdF9mb3JtYXRfcGxhbmUoZGF0YV90ICpkYXRhLCBlbnVtIHBp
cGUgcGlwZSwNCj4gK3N0YXRpYyB2b2lkIHRlc3RfZm9ybWF0X3BsYW5lKGRhdGFfdCAqZGF0YSwg
ZW51bSBwaXBlIHBpcGUsDQo+ICAJCQkgICAgICBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgaWd0X3Bs
YW5lX3QgKnBsYW5lLCBpZ3RfZmJfdCAqcHJpbWFyeV9mYikgIHsNCj4gIAlzdHJ1Y3QgaWd0X2Zi
IGZiID0ge307DQo+IEBAIC0xMDQ2LDcgKzEwNDYsNyBAQCBzdGF0aWMgYm9vbCB0ZXN0X2Zvcm1h
dF9wbGFuZShkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLA0KPiAgCSAqIE5vIGNsYW1waW5n
IHRlc3QgZm9yIGN1cnNvciBwbGFuZQ0KPiAgCSAqLw0KPiAgCWlmIChkYXRhLT5jcm9wICE9IDAg
JiYgcGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZUEVfQ1VSU09SKQ0KPiAtCQlyZXR1cm4gdHJ1
ZTsNCj4gKwkJcmV0dXJuOw0KPiANCj4gIAlpZ3RfdmVjX2luaXQoJnRlc3RlZF9mb3JtYXRzLCBz
aXplb2Yoc3RydWN0IGZvcm1hdF9tb2QpKTsNCj4gDQo+IEBAIC0xMDU5LDcgKzEwNTksNyBAQCBz
dGF0aWMgYm9vbCB0ZXN0X2Zvcm1hdF9wbGFuZShkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBl
LA0KPiAgCX0gZWxzZSB7DQo+ICAJCWlmICghcGxhbmUtPmRybV9wbGFuZSkgew0KPiAgCQkJaWd0
X2RlYnVnKCJPbmx5IGxlZ2FjeSBjdXJzb3IgaW9jdGwgc3VwcG9ydGVkLCBza2lwcGluZyBjdXJz
b3IgcGxhbmVcbiIpOw0KPiAtCQkJcmV0dXJuIHRydWU7DQo+ICsJCQlyZXR1cm47DQo+ICAJCX0N
Cj4gIAkJZG9fb3JfZGllKGRybUdldENhcChkYXRhLT5kcm1fZmQsIERSTV9DQVBfQ1VSU09SX1dJ
RFRILCAmd2lkdGgpKTsNCj4gIAkJZG9fb3JfZGllKGRybUdldENhcChkYXRhLT5kcm1fZmQsIERS
TV9DQVBfQ1VSU09SX0hFSUdIVCwgJmhlaWdodCkpOyBAQCAtMTE0OSw3ICsxMTQ5LDcgQEAgc3Rh
dGljDQo+IGJvb2wgdGVzdF9mb3JtYXRfcGxhbmUoZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUgcGlw
ZSwNCj4gDQo+ICAJaWd0X3ZlY19maW5pKCZ0ZXN0ZWRfZm9ybWF0cyk7DQo+IA0KPiAtCXJldHVy
biByZXN1bHQ7DQo+ICsJaWd0X2Fzc2VydF9mKHJlc3VsdCwgIkF0IGxlYXN0IG9uZSBDUkMgbWlz
bWF0Y2ggaGFwcGVuZWRcbiIpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBib29sIHNraXBfcGxhbmUo
ZGF0YV90ICpkYXRhLCBpZ3RfcGxhbmVfdCAqcGxhbmUpIEBAIC0xMTk1LDcgKzExOTUsNiBAQCB0
ZXN0X3BpeGVsX2Zvcm1hdHMoZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUNCj4gcGlwZSkNCj4gIAlz
dHJ1Y3QgaWd0X2ZiIHByaW1hcnlfZmI7DQo+ICAJaWd0X3BsYW5lX3QgKnByaW1hcnk7DQo+ICAJ
ZHJtTW9kZU1vZGVJbmZvICptb2RlOw0KPiAtCWJvb2wgcmVzdWx0Ow0KPiAgCWlndF9vdXRwdXRf
dCAqb3V0cHV0ID0gZGF0YS0+b3V0cHV0Ow0KPiAgCWlndF9wbGFuZV90ICpwbGFuZTsNCj4gDQo+
IEBAIC0xMjI1LDEyICsxMjI0LDExIEBAIHRlc3RfcGl4ZWxfZm9ybWF0cyhkYXRhX3QgKmRhdGEs
IGVudW0gcGlwZSBwaXBlKQ0KPiANCj4gIAlzZXRfbGVnYWN5X2x1dChkYXRhLCBwaXBlLCBMVVRf
TUFTSyk7DQo+IA0KPiAtCXJlc3VsdCA9IHRydWU7DQo+ICAJZm9yX2VhY2hfcGxhbmVfb25fcGlw
ZSgmZGF0YS0+ZGlzcGxheSwgcGlwZSwgcGxhbmUpIHsNCj4gIAkJaWYgKHNraXBfcGxhbmUoZGF0
YSwgcGxhbmUpKQ0KPiAgCQkJY29udGludWU7DQo+ICAJCWlndF9keW5hbWljX2YoInBpcGUtJXMt
cGxhbmUtJXUiLCBrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSwgcGxhbmUtPmluZGV4KQ0KPiAtCQkJ
cmVzdWx0ICY9IHRlc3RfZm9ybWF0X3BsYW5lKGRhdGEsIHBpcGUsIG91dHB1dCwgcGxhbmUsICZw
cmltYXJ5X2ZiKTsNCj4gKwkJCXRlc3RfZm9ybWF0X3BsYW5lKGRhdGEsIHBpcGUsIG91dHB1dCwg
cGxhbmUsICZwcmltYXJ5X2ZiKTsNCj4gIAl9DQo+IA0KPiAgCXRlc3RfZmluaShkYXRhKTsNCj4g
QEAgLTEyNDIsOCArMTI0MCw2IEBAIHRlc3RfcGl4ZWxfZm9ybWF0cyhkYXRhX3QgKmRhdGEsIGVu
dW0gcGlwZSBwaXBlKQ0KPiAgCWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIGRh
dGEtPmRpc3BsYXkuaXNfYXRvbWljID8gQ09NTUlUX0FUT01JQyA6IENPTU1JVF9MRUdBQ1kpOw0K
PiANCj4gIAlpZ3RfcmVtb3ZlX2ZiKGRhdGEtPmRybV9mZCwgJnByaW1hcnlfZmIpOw0KPiAtDQo+
IC0JaWd0X2Fzc2VydF9mKHJlc3VsdCwgIkF0IGxlYXN0IG9uZSBDUkMgbWlzbWF0Y2ggaGFwcGVu
ZWRcbiIpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIHRlc3RfcGxhbmFyX3NldHRpbmdzKGRh
dGFfdCAqZGF0YSkNCj4gLS0NCj4gMi40NS4yDQoNCg==
