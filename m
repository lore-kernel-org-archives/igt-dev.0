Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7FF606A321
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iQr3LN+i;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Yp+zhsVr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EC110FCBB;
	Thu, 26 Nov 2026 07:13:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845091120AF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795677061; x=1827213061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=silPKkFoUFBUod1Rn81nHpMQCxYLP0YxwzAqqnV8Nr4=;
 b=iQr3LN+iXoqaVX16OdEVwT4x51nTkn3H4DgIWJA/Z00jo859uZWFvxE0
 w4O5XqRQAua7sSf/gzGTmTghqHUg1HuZ+BoR5THGB044iSqjgRQCFECnt
 cx8RsCfUTvqLYlq6WZO6bAeuTO+wIzr/skPhFsvDKb1LmOZe5qrFt34Ww
 2s0V3IQ5Ef5l14dOk/CJYjlVPM3yAxvx+bQx3xVsu6iQ2qF2+xqGHng7g
 9wFE4XlrLh8fQ4o0TLtHnR2nqRWmBCaIyudn2tZ8uC8SQk3P1XlB2ber2
 RXg/THr+hYlA65UvUR9/Ce4/mi8TCtF3U10LiMc9lVfKqBChorpKN8cxn w==;
X-CSE-ConnectionGUID: Q7r36+50RPeZ6wmnYZCmJg==
X-CSE-MsgGUID: zF+A3EGsRnSUll7Wqyikog==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4543973"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4543973"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:11:01 -0800
X-CSE-ConnectionGUID: oT20IFIXSe2lIkLMarGsIA==
X-CSE-MsgGUID: 84qpigTCQe6c3uDv2FVGFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12525076"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:11:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:10:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 23:10:59 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:10:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0aTf7Yv1vwv+/oMmkvifj+z4pUWVTEubMLQ6C/rRItYxEWIT8zsiobuJ/bOtChPpZ32pEC0BwgbNHeJfHaSyr6CYtzAABd5h73vrMbgYn7vO4jqS4B9Ab5tpS5sM5fyK87GL436C2mZZviwMcDirD87OfFlCfumpJm/vrjhuKVE8d2AdMoRjVHuqAdP7hKC4qUUdZDAq9KRutPv9SzdD2F04crC6l3hr794I2NxKjfN8lSe6dZ0wBifnnEI/c741uiXDDlN2zAnQRl0wI+Ba60gRBcopZgh1FfLDeFsWyrQjEMRedZ5rggvRMtIbpjq5ryApxSwHUxpwHCPrmqrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HD+kLeC+tjX08mR2e1gqQPkdb/qMvAPALMpB3HXcFE=;
 b=MrbkbzN2GYH9FQrNz9IxhwmZGcxEhVwWZ0FI+m4YdPEXG+/LSfJbdzxE+dpgXyIq/Rjk9xFDWiry2cAIlE0iZYUMiSEk4gwnv5h3yIAB4rqI2Yfc0HMbB/FA8dfLBrSKOKqikM3zcRrlS7LOpG7iDCecHxginx6tZA8/PpLwKxAqo50F27p3sxAcEj0k8H4kow5Qooqz3xsfW9N5seWlLkUfxqMXCnu3iDnEfpRk/Gd9xQQEo/I6N/bYajAUVpTuvwMX7qGySt8CN/j1K2Pk8PUOb3vCDrmbO2RJyPvFBsfUkecsigCKyF5Zouw2XN+BUeKaC9iE+Nx0FrUWWy5Y+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HD+kLeC+tjX08mR2e1gqQPkdb/qMvAPALMpB3HXcFE=;
 b=Yp+zhsVrZMgszjBJXl3/cVpc8nyxBdc89jRRC8HruPUYgPDEzt0wQxlG2RM/sjNwji1VVqG/meSq3wpQx9LmuvNNcU9UTQzza58/ZksYm6PLsdlXMw2Rd9xVcbzlGVe+963TpmDT+qFNlCwAKmK/EurVPgsK/OwpJ8iR8aRUry4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 07:10:55 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:10:55 +0000
Message-ID: <b6d0d1f2-61ae-47e2-827a-47c0e0d11c5c@intel.com>
Date: Thu, 26 Nov 2026 12:40:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] tests/intel/xe_oa: Check OA buffer mmaps across
 unbind
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <harish.chegondi@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
 <20261104005505.3232485-14-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261104005505.3232485-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::15) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b9cfab-58cc-40a9-dd3b-08df4b8c6999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: FE1XKDZCRKFPEChhK0QK3UDb1TWOfNf35eePzgoZlGt49JdgZqKGZ99smcBHKipscn+6qXmF36ABPpkXFs/2SHOXBxiP/qEPsBwDwO2w6GMKoBHSbR3HhPwTD8owV0WKTJckFPE6NkSnpUVtzuuNxYHzaNABrd2Gy2Y77NfB82IuOvJ/nphXUWgLMGMo03Do8L1DflvV/mJ450LKGlcbtiLKgsTs7OgCNeuKnWavlhO6vL/Ks4jaqxin8bl3+FKhb7Eg2gzpluX/UqySq1G6PMFbD8uYzDwjTGiEJX+aDBP4z+vfq041L2a8bW8e4lpB6TMFWIVBwQTbDoUHtGIaREoIfCS/XTZvR0Fb+9cPuu8zb8p0ybECrQXhJkYBhEUbUOjdTKpJ6jrudfpKmGbq5i0NE9CiYbNOMMbbHQrCnr3vyvDeW2wLnEvOqTQj6o3aehA2e6y7fnG/2CXO6BzkSMcrbCONKivN3neKlhEfqeHUnKuSXDFsw/br+Xi5MJCOHjbOBvkM9Pu8XYZIdkqQYwShomqDjlEP4KoGVgp9ce3bRYmq11iAMZjwJkqjHZgDXJwE7dBAXaXauZ8WoxyoY/hoW8vxpG8P7glKLDmWNuoheRBndPh4xXVdV6IxgG31l1GR7rAF2Pb5oqFhe81AE3EpGrDZxiSs6GhZWyv4vVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlVSd0FGb0s4VytMU2o3MzFrako0WUNGdFhTZjZhU082OXc1NnhMUmVNRlox?=
 =?utf-8?B?enBCUWk0cUJZaHZuRmZEU2JETDV3bjNKellrQlVMTER0N015VUpkamZrZWhZ?=
 =?utf-8?B?OURXQ3kxYzMvb0JWMDJkWVVoUGllQlRaK0J6RFRCWnRKUUZqQ0k0QktQam10?=
 =?utf-8?B?SEVLMFR1bDU1TEEyc0E0NGJNUytYWlFZT1JVYUhEeHl1cUV2R2hjTFV3dXJ2?=
 =?utf-8?B?VDEwWEpITHRiSjNjUzR1RWVqcjVzRGpPNDRZQ2Rjek9meDVWRW9SV1c3d2hu?=
 =?utf-8?B?U1ZZOHZ4dmYxb21IRjhmN3gvWGNwd0YzR2VQUXptOG9rd1pHMG9aeE1UR3do?=
 =?utf-8?B?Z0RFQ3lHZGdkRm9kUEFwRm1wVUtQQVdFQ0hyVXRqdCtHaUowT0lyQTc4eS9G?=
 =?utf-8?B?Y1lxY3I1SGUwUGFyQlBva0VLZjd4SlFkNVpMNm1BQVRzNURGeDE4aW4wbE5y?=
 =?utf-8?B?TnBpNnRZQ0lhampmei9pLzNMYjkrZzIwS3RIRm5ZdGFpQ2JhNmtVWEdzRG1l?=
 =?utf-8?B?UDVIcENPZ0NlQzI2ejcvcjU0bUlhY25QSTRUaENnRCswSDk4Sy9OQmxZZWoz?=
 =?utf-8?B?VEtScEFZdTBRdjJhSk1qblRCVlRhaHRYUXFrY2FzRWhHNjJ4Y2pMcHE1b3p1?=
 =?utf-8?B?M0NqWkRuMmZucGJuRXU5SzJobW9PeTFoZ3A0bUhLWlc1RHNIdkVxNThvRzRl?=
 =?utf-8?B?RFV5dmExM3RzQ2xEYk1IU01IMEtZVnlTVGI0WVFqclJSNzN0SDhCSTZEZHRF?=
 =?utf-8?B?dkF2ZlJNWW5wRG9VRU1kNnBKamYwR3QvaGdBT0pKOVJxNG5LYzRrVDdmUGwr?=
 =?utf-8?B?bGY4ZWZaVlIydGlBUjl5bXYyR0E5a0VnU0tXUFV2dmFRaG4ydjZYS3NtTmYx?=
 =?utf-8?B?TGQrVllJRlJOY0xML2FXa0Q0K2dNdm1odjBCSGN6dmo0emdvZGVKaldoS2Fn?=
 =?utf-8?B?UUZSSVFtYTdXZjlUdU9sbW1JMjFSMUx3ZU01TkVQZ2NxbEQ0eVdOcWl4Z1JG?=
 =?utf-8?B?RTdaZnNxakZycW44cDloN05hYjlIOG5peFQ5RVBkNkYrQ05maVdCSGZZYXR4?=
 =?utf-8?B?Vi85QVI4VjNWUy9tZkpzdHdENkoxbWRYVGxmek92cElYclVTam1sWDdkRFYz?=
 =?utf-8?B?VWdYdHBlbU1FNVBpWVVIMEZxekFySXNrNVMremIvaTl4K01Fc0lmZERIZi8x?=
 =?utf-8?B?eFlvVzU3eWVXUjBGdWhBNWRQNUp4dFNmZWNxU2FpSW50cEdFQUh4MHFUdGh5?=
 =?utf-8?B?Y3daajduUFRVbndYcVpraFBCMEw0NC8vN0tXZ2N2WlZDQnFFZnRiS29wTElG?=
 =?utf-8?B?aWJjdUFHU3E2SWZuMjBSSk1zZ2pDcC9yRmxieEIxRmEyT1hJaFhBMVFXeHRH?=
 =?utf-8?B?a3B0VXFZUHVteVJEUWlZYWhSbWk2Qk9mMkRFdG0vNFNOSnFVZndyOUpGL3By?=
 =?utf-8?B?Ti9pVGV5TkJxcGFYY3BBQ3B3Tld4TGtGRmRPc0t3L3J6NUFjekZXQTloZ2lC?=
 =?utf-8?B?SXppcUVwNTJ6cStxS0IzYlY4ZDRadnl2NzhaZStOczRCZUNvQzdWMWNnaHVV?=
 =?utf-8?B?eHAyaU5oZkRZcHJRU3F5Vk8vVVdGeUpwRi9Idm9DR3Y3MWJoNUQrT25CWWt5?=
 =?utf-8?B?NlBQZE4rQ2taVGJFUG5TQlY1Z3hWM3NQZ08zOXBLSklzSTJBKzBwa0d2MG9i?=
 =?utf-8?B?REIxd2Q1aWVOTFJtdGlldC81ZzNKN3prQjJWRXJWRXBuYVA2VmNnMFVHTVEx?=
 =?utf-8?B?WVRTTFI5MW1MU0VYRnhVcWd3ZXZZbHF4bGQxeEphbmFrNmFVNUtGaWFudWRj?=
 =?utf-8?B?cWM2ZlFiSmhDMGtrYmZLMEQxeFRWckljdHFLMC9aSndCT2F4V2tRbGNaNzRs?=
 =?utf-8?B?N1huSUtROC9hVXIxTDRqVGpmNUU5R3VxSkFSQU5uaXc0SGVaRUFOZmNpeFVB?=
 =?utf-8?B?Y3NUVmVJME1PUFRlNmxEenk5dXc0T2pENFFMbUE1bGNJMUJPNit0dUdyTzlL?=
 =?utf-8?B?MW8xOFpKbUVFTEUycWJQajJqUDhjWEtWSFNHMFhJcnZIVlYydVVFMDlRVHFT?=
 =?utf-8?B?YzdmOEZSNmJCdHlodVZzYjBLOGdQWmNKRXNvTENkVVJlSHFJTDRoSTU1QkR4?=
 =?utf-8?B?UDA5UUQxcFRzcnRyK2EyVjZUZERPeUdWUFRDNHZHUTJmMjlFMnRrN3NxVFE2?=
 =?utf-8?B?aXlUMVhydEdIT21oQ0hybjV5Q1ExZ3o1UmJwbFNEOEdUaGRSZnhIZGhvaWtC?=
 =?utf-8?B?cjdNNUpHOHIvcDBkcHZoRVhuQTR4cVNoaE9iaW9Lbk9Cdk42Qkp4SUVJb0RL?=
 =?utf-8?B?U0ZYWlVJc3g0cDh6V3UvcFdXMGJka2wxb3BqS1FKUDlhY0pEU3lwQT09?=
X-Exchange-RoutingPolicyChecked: f5XRWSZrG35S3AnrT3Th3K0TS9ooW7plOnaerJc+2Ft2dB8gJjASWgjdx79rDIk01g7AMux6BgVZXVmyNTfvAhOdgb/qzzpntanxEJiFHTs7dcKnuZlmdy6SP1EqDNosNQpkTPlckNXUqoBJmRUILnrveXE1QvuCKLspZ05nMkTjXTmt+VVGaDeyTsDc41695tCs9kKmI1IqbfeyZgvf9JCGN1bCGLyHchXv44aq33qa+mMJLVwWazh/e8G2jRp77HZIrbc7euZFTmB8mo/yAdZFq1C83te+17kJ8cE7waAvIabrTSwrEE476QMvK1jURAyxS0JyNb8Bg5Si8oboSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b9cfab-58cc-40a9-dd3b-08df4b8c6999
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 07:10:55.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSTi8GQVyBGFdA3tnJsm4sBnGp2LhTAQ7SFAO8QQ9vv8Q1aVxEhaSYdkWDxc8Ldf6SzfWO46R5MpeFZLxNaZed/UkQdexTeS9GcJTQBLKSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/4/2026 6:25, Umesh Nerlige Ramappa wrote:
> mmap the OA buffer before unbind. Unbind zaps the mapping and refaults
> get a zeroed dummy page, so check that the mapping reads zeros
> afterwards, after making sure it held OA reports before. Also check
> that new mmaps of the stream fd fail with ENODEV.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   tests/intel/xe_oa.c | 55 ++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index e10b77bca1b2..e4b63c982200 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2831,6 +2831,18 @@ static void probe_stream_after_removal(int fd, const char *when)
>   	igt_assert_eq(err, ENODEV);
>   }
>   
> +static bool mem_is_zero(const void *vaddr, size_t len)
> +{
> +	const uint8_t *p = vaddr;
> +	size_t i;
> +
> +	for (i = 0; i < len; i++)
> +		if (p[i])
> +			return false;
> +
> +	return true;
> +}
> +
>   #define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
>   
>   #define UNBIND_MAX_STREAMS	16
> @@ -2842,6 +2854,8 @@ struct unbind_stream {
>   	struct intel_xe_oa_open_prop param;
>   	size_t report_size;
>   	int fd;
> +	void *vaddr;
> +	size_t size;
>   };
>   
>   static char unbind_pci_slot[NAME_MAX];
> @@ -2853,10 +2867,12 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
>   {
>   	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>   	uint64_t fmt = test_set->perf_oa_format;
> +	struct drm_xe_oa_stream_info info = {};
>   	int n = 0;
>   
>   	s->oa_unit_id = oau->oa_unit_id;
>   	s->fd = -1;
> +	s->vaddr = NULL;
>   	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_UNIT_ID;
>   	s->properties[n++] = oau->oa_unit_id;
>   	s->properties[n++] = DRM_XE_OA_PROPERTY_SAMPLE_OA;
> @@ -2875,10 +2891,20 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
>   
>   	s->fd = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &s->param);
>   	igt_assert_lte(0, s->fd);
> +
> +	do_ioctl(s->fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
> +	s->size = info.oa_buf_size;
> +	s->vaddr = mmap(NULL, s->size, PROT_READ, MAP_PRIVATE, s->fd, 0);
> +	igt_assert(s->vaddr != MAP_FAILED);
> +
> +	/* Fault in the mapping while the device is still bound */
> +	(void)READ_ONCE(*(const volatile uint32_t *)s->vaddr);
>   }
>   
>   static void unbind_stream_close(struct unbind_stream *s)
>   {
> +	igt_assert_eq(munmap(s->vaddr, s->size), 0);
> +	s->vaddr = NULL;
>   	close(s->fd);
>   	s->fd = -1;
>   }
> @@ -2894,13 +2920,34 @@ static void unbind_stream_check_live(struct unbind_stream *s)
>   	ret = read(s->fd, buf, sizeof(buf));
>   	igt_debug("Pre-unbind read: ret=%d\n", ret);
>   	igt_assert_lt(0, ret);
> +
> +	/*
> +	 * Reports are written from the start of the OA buffer, so the mapping holds data
> +	 * now. Makes the zeroed dummy page check after unbind meaningful.
> +	 */
> +	igt_assert(!mem_is_zero(s->vaddr, s->report_size));
>   }
>   
>   static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
>   {
> +	size_t page_size = sysconf(_SC_PAGESIZE);
> +	void *vaddr;
> +
>   	igt_debug("[%s] checking stream on oa unit %d\n", when, s->oa_unit_id);
>   
>   	probe_stream_after_removal(s->fd, when);
> +
> +	/*
> +	 * Unbind zaps the existing mapping and refaults get a zeroed dummy page instead of
> +	 * the OA buffer: check first and last page
> +	 */
> +	igt_assert(mem_is_zero(s->vaddr, page_size));
> +	igt_assert(mem_is_zero((uint8_t *)s->vaddr + s->size - page_size, page_size));
> +
> +	/* New mappings are refused */
> +	vaddr = mmap(NULL, s->size, PROT_READ, MAP_PRIVATE, s->fd, 0);
> +	igt_assert(vaddr == MAP_FAILED);
> +	igt_assert_eq(errno, ENODEV);
>   }
>   
>   /*
> @@ -2915,6 +2962,8 @@ static void unbind_rebind_recover(void)
>   	for (i = 0; i < unbind_num_streams; i++) {
>   		struct unbind_stream *s = &unbind_streams[i];
>   
> +		if (s->vaddr && s->vaddr != MAP_FAILED)
> +			munmap(s->vaddr, s->size);
>   		if (s->fd >= 0)
>   			close(s->fd);
>   	}
> @@ -2936,9 +2985,9 @@ static void unbind_rebind_recover(void)
>   
>   /**
>    * SUBTEST: unbind-rebind-stream
> - * Description: Open an OA stream and test the effects of unbind and rebind: the stream
> - *		dies, no new streams can be opened on the removed device and the device
> - *		works after rebind.
> + * Description: Open OA streams with mmapped OA buffers and test the effects of unbind
> + *		and rebind: streams die, mmaps read a zeroed dummy page, no new streams can
> + *		be opened on the removed device and the device works after rebind.
>    */
>   static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
>   {

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

