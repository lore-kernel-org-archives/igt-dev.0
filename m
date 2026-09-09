Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C303C79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 07:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3519F10EF91;
	Wed,  9 Sep 2026 07:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfMqDL85";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC0E10EF91
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 07:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788940573; x=1820476573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qyRzkWkqOAO8y25Yk9rjKdDFgOXfrz+XjHFy95cPyrw=;
 b=CfMqDL85c7/VeMSISb4TyVnqGeyfFJlef3jhd6cP5wH8gzqlDvaq2wns
 lhedQeNqfvUV31jYwVZSqV74THrPy8zjVCeeLGZR8MNoFdxBFkfC199Qd
 DZCF1LudN4UGoH7Px2mdHsQJuI+jie3SArLF6yyJCHlOozmIfr7U3GQoS
 taqRQvp5vgEzyLlOyfx7kbXOhXN4FuVDnYfBvAdsRloIA7P0QApN/qAad
 Ll2Awse4rNIZJfOW4SB4BgacBGhJTCuHrHWhDHIRmub+XCHEhQqahZjCq
 MiCDei88XOz3LZwHsx2Ip4sKoQjPrHkov9SsWXMyNrDLEwLeNP/3ivsUd Q==;
X-CSE-ConnectionGUID: x5AEAHk1TCmAqYIXNJLNSw==
X-CSE-MsgGUID: eWpdMmtuQ8a+q7KNDvEVbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88505618"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="88505618"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:56:13 -0700
X-CSE-ConnectionGUID: SwqVpRAtQ9+C+1VnXiP6Rw==
X-CSE-MsgGUID: Wks5G8h5Sh2ne+UvRAZRXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269901516"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:56:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:56:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 00:56:12 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:56:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbONmtohpa6WZdb0jo2oIX+2rDtJrmdrdprVNErC5qXtUDGjSJWCIV6TovXeD/Oa+Fega32i5XbZ6z/Jj4JjVmwFG5EZzlTkpzJNHSgc4zBIe/fpmsW7n6NW3xT4zDJzRRVhgKXAKBxqMqKvWL/IVo7NSUgZUFz9NxkUgGgwkwp/KjBzEx7oLgXZqg1FKpMoOmstX9vek5yS/+QpZuM4PCwsjC2NIPu9vuFBwBS9FpF+EFGIqv26zg75CiyXjMI4znXoezIk2j3klRSsL2eFrTA5RRJUkoZqceTOWWLVmRI9FO+2Tik3YbJBh1iLx3Mewa5/9OQA0izz4zRHs91nJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5Wsd00Obgqzt6aTSG/rxjknQm3r0UrPHOtCcYaJHxk=;
 b=VFA7vpXY1VF+XFen+HxksGwvUFb0P4V2NwfpOKN1JPjRB5n1DllAJcuapY8Lnv8C6kbkQ/nx7wcKzEBldrIQIs0OHZBYd15vz54/xK4X73QfMI96LghcEB8aEvHfv67ihOhESu2nbCtQ7jXPePDYUELkdF/nmlg5HVvVVifiZhVy3BpAKlP6yN4+Lf7Bn72jz+Pahr01BIcpUZiD2fuV+zs8sAbMcCb9hZR9UDDQ4Ydr5X5WKd09QXvFsy4bSrKv9Oh8bLd66OMcXDzDlCFZLdbatchDMdxvMBa4+SGjUDTje2MQCf9Kh4//quRjvGNqy5klcWtrnxs1xhsIzwcIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:56:08 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 07:56:08 +0000
Message-ID: <43b24b77-0be6-45e7-921a-488c8ba6c674@intel.com>
Date: Wed, 9 Sep 2026 13:25:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 6/8] tests/kms_properties: check colorop
 properties on active color pipelines
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser
 <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-7-mwen@igalia.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260902180016.303482-7-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0242.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::16) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb1dbe4-1c72-48f2-b6cc-08df0e47cebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|7416014|376014|1800799024|366016|4143699003|11063799006|56012099006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5REPr2vTacyiwompyRoe7jJvI8x2cD6yDmz6tBsDPY/N2W2FpPQfdHpHi3GGabHOmrjs61FAfNUMbkAMBB7LGl5rVdtaFuYSsHZjjGLPZVBAjweUTLA5jJte+gIQOPm+bEldywk8q1NxepABKNknLxGK3HfddF3MBh5n7OslzynEUUOEX70IDu2oeW6xEesmjIO+64G9d7+95NAFLke2fmxK+uZ9YF0dQKFK206b900wVso38R+LC7nsKltx7yUc5EtGH5PVZ5dhy9XgNndrKbJ04FCeRRVZErAreWgPemkxd0m6mWiFQwlW5Cg8w1/s6tx556YeqTfUekQKf4d+2tto7X2Ms+GpPW7+/6vv/QkU5cWCQgh6xaOAlItqjEvu7Dl68csifDWDV+bg8KTeKWMHKPbW6uupXJPOpQ1Bj7O7SnQ9t2DEp3ri61hMzN+Ny8OUist17YiMeGOPrKWwndAOqI86b1iZL3pTh1d0VTYaywmkdBKiEk/ETnA4jp/m1HwOcYhL6XGB6wujb2/StC+jmdGhQdVmtOf+tg4G+hH1xbqWjPTdmDSFSTEjj/ItJSqb6cM3CUyvLicWCnVEk5WUZ92ShEcwte/EjBCrJLnAXhGBbHFvn2AWBHQcj1sogceFVM9MxBiVrmyCr+5n2BHKMdADgM1AKjXbS/r3Plw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkFzOVpKdnZlTVl1eHBrRWZZak5hMHVVcGJwRHBGeUZLYitBQW5ScnNPTmpk?=
 =?utf-8?B?OEtGa2ovK3B3UVMvb2VVZFdHSGdDU29ESXhmcHRXSDQzSU9QYWtkQ2pkK2VD?=
 =?utf-8?B?em9NNUdjYkJwTjN2cHRoa3VrOVFmUGJNZWdQQmg2ZTBxclE4NnNIa3VqZGdF?=
 =?utf-8?B?cmkvVHduNVFtWHZJZTVaQVBMVXBCb1ZBWGFkckhLbENWaGFnM2hQRXd5dC95?=
 =?utf-8?B?Z2lWK2NDdm0zVWE1dk9KTDMzUCtQZFh4MjBEUDNWTDRNckpjWlVEZ3FscDBD?=
 =?utf-8?B?SzNEcXJlcVJqSU1QcmRqeFlhN3Z4bVk1N29iblNteHRFcTdHTWpkYTIvb21Y?=
 =?utf-8?B?ZmdmMm53dUpaRmhUbHFxKzR5UlE5TWg5bjZYY2NGZ21kZVFVU0dVOHVmQklL?=
 =?utf-8?B?bW81YWp6dGxPUTZnRDVwUy9BcGJRZWVKcXB1dll0SDg4VG1nSWIrSkRGL05E?=
 =?utf-8?B?N1dwNGlJMFk3eEZYYTBuQjdTSWtyTERXQ2RvWUVNZzZzMSt5dHA2YXEvMHZq?=
 =?utf-8?B?ckxDdjRUcG13RExKTGVjaUlUM2R1bDRoNHZPSHdaMkhxYU5DRWRRbXIzUW9O?=
 =?utf-8?B?alM1Y0dHWnJRVi9ncGNEbVQ4T1lrYnF1ckh0TFY3bWNFUE5mMGVUUklaU1kw?=
 =?utf-8?B?WjEzdnl0T3FXeDZuTUxOOHAxSVJaTS8vWVUrcEZLVDM5eCttUUh0WmRwak91?=
 =?utf-8?B?eUVheDAyQzZrb2dPZFoxK2Rhd3FHUVdtV1I3dzdYQnpBY3loYW9wSzhEWDNS?=
 =?utf-8?B?NmcrM2xNSUZxRUZ3QXVXdUVLTW1hbkZIV1JVVU5oeFcwU3d4Q0p3bDdaeGM4?=
 =?utf-8?B?Z01KTll3cUtXK1JNRUJzdkh4ZVhxVmxsM3RQdXhzTytqT1Nubmh2eVdtNXlM?=
 =?utf-8?B?TUF1QWE4OXRpcURyQUJmd05zcUFnSmd3M3dzMHRwSmJDMzkvYUdIejk1ZE9O?=
 =?utf-8?B?S0tCM2gyc3ZGL0pEUjlMT252d1hRYlJIQVYzMjRTZTFMaStyeThCTFAxRE9r?=
 =?utf-8?B?bXlBM2pNQ00zSitHblBIaHJTQUp0bkxvMUh5SjR3QzRQT1I3NHNwaXQzeTAr?=
 =?utf-8?B?Rmc2Vkl5WDdpU3M1Um1CNHhOY1JVTDBML2g4bnNhbmo2cURJMnlRalZ0TW94?=
 =?utf-8?B?bUdiajhwT3diZVZJVStMNkFHd3ltRUpnbys0Y1RjNW0vWW5OelZnT1hwU1RS?=
 =?utf-8?B?b2U0NFhjR3dXSDFMcGwvd3ZpWHl2RDNSUnR0dk83RjFGM0ZYNGc0M0pvLytp?=
 =?utf-8?B?TjF0TzBCTzJkLzZUeWFwUWNqNjZtTkFKWER2eGQyckZqdTZuT3ZXU2F5MXRu?=
 =?utf-8?B?R05qQ3hwaVl1REtZQTVqS042T0xIUUpiMzRvamxsWERVbVU4WkplK00zc0ty?=
 =?utf-8?B?VEdiRXBxMkRoaE9kNldIemE2bmV5djg2dlREaldBNjhNL2k1dThVZHFqckEz?=
 =?utf-8?B?RVM0UE54RmM1Rk1RM2JwVFdoSVo1L05zUVgvRVdhOWF3OEh4TGdiZVhvczdx?=
 =?utf-8?B?eW9ZYkdRRk5BYVFPWXNpYjYvcmhjUVpCMmZxb2VZbUxWWlFHWUtlZ3g3SmxS?=
 =?utf-8?B?UlZNazZuYkVTeVB0QWhYeXFtVklPT0JIbWpBbThQNCtoelRLMnhTMllLdjNm?=
 =?utf-8?B?Lys1dmVvdDZTZVhnMkZwK0E3aDBWV2tHWkRpejFuQkZlQUdqRjAzQ1FFdjRG?=
 =?utf-8?B?Y2pYeFN5MmpQVWJVYU0wdXY5UUUrUGN5aUpVbWRVV08ydDNEZVF1SWZtUEhk?=
 =?utf-8?B?NEdBc0FBQW0xTFhtS3kyUVo0MmpSRWdxb2hwQTc1VHlRSG5kTDB0Uk5BR3RW?=
 =?utf-8?B?MDRabjdza0EvTC96cVdLRFlaektiOWlLSkhsbkxMN2gwYThWT0grYkxJTHRt?=
 =?utf-8?B?Uks1c0tzKzdVTVA4Q2Y0Q2VoVjYyRXFGRjlaV3ZlWXZxcWpDVFJaRktBM1Ey?=
 =?utf-8?B?bVBsQXd3Z200aUJSczE0aEcrbDdXbDBIZVlUUHpHc1lxN0tRcXV2VnY2cGRR?=
 =?utf-8?B?UHAvaG9mc29qZjhSS01BSzhnY0RMRDFBdWQvTzU2alVZbWZhOVp2L0oyNlVu?=
 =?utf-8?B?ZTZjOUpkNlRzc3VUZDNBeGNqQTA0RGdWUWd0OFRYVEs1UkM1NnBXK0xPTlhh?=
 =?utf-8?B?UmlWVEt4NFFJSG03dWNxUFdoL2VUN09EemJiWEc1NlMwRFQxaGRkeEdSVCtu?=
 =?utf-8?B?YkIyQkp0LzBkYWh6ODN5b2dQMmF1bHA2WndvVFljMnRBZUdmNDJVM2ZmOENG?=
 =?utf-8?B?QUNRZ1ZXSDJYRlNwZG1wZXJjNnFwZ3VFU3FKcXFWKzM5VitIRVpMU2ZrN2xw?=
 =?utf-8?B?dnZaeE9nYzQ4ZGc4eGRKMGVVWVhMc0x4cFI2NXVQVGpMNVZJTUIvelZVZWZH?=
 =?utf-8?Q?UEMIVbcW5BjAE6WI=3D?=
X-Exchange-RoutingPolicyChecked: lXVHgE7tD1SnloNPa7CuP9oPbnMtHi/TOW+uEcBd2PmRZDKvX8EObtD6CR/QRQWpzW8jhGrqoqfq0vpbQu9669ii2Ux11TIw/KEN4fHw4Z/e/hBKSZbjU0Ee7rPsET+ZHLM66xtnIZVMN318nS/4ir2hGq7fX4G/luBNBQI7e7YcL2lGgdQyhwP9yn1Pl2SagvAQciprvOM6AqzlWe4yYxdxcQ5jRj4U0s9pDD+R5mJASySlvkskaC6R+5bu1GdL1bfblwMJTOPYlQ9vJAs8T0stByzDT77Bq/zYqdLHOJuwLBWGnqM3xDLCEhBs0cuGBbB9Z0XgbZoneLrtGJDgkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb1dbe4-1c72-48f2-b6cc-08df0e47cebe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:56:08.4864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IX5SCgu75vijGuI3r30epZYrOS33C0S2VBC+LkDSyEbqNbehhcqfqwvDEZEFyGr8aTLQrR+u12q5dKTw36Q5t+eHCf8WgkWELTbYZJ2pQgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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



On 9/2/2026 11:28 PM, Melissa Wen wrote:
> A colorop property can only be changed if its color pipeline is active,
> i.e. the colorop is in the chain of the color pipeline set in the plane
> COLOR_PIPELINE property. Set each color pipeline active before checking
> the properties of its colorops, and restore Bypass afterwards.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> v2:
> - detach different changes from a single commit (Chaitanya)
> v3:
> - move hunk to the previous commit (Chaitanya)
> v5:
> - add missing commit of bypass color pipeline
> ---
>   tests/kms_properties.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index c55a271da..76aadd162 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -271,6 +271,9 @@ static void run_colorop_property_tests(igt_display_t *display,
>   		for (i = 0; i < plane->num_color_pipelines; ++i) {
>   			/* iterate over all colorops in pipeline*/
>   			colorop = plane->color_pipelines[i];
> +			igt_plane_set_color_pipeline(plane, colorop);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +
>   			while (colorop) {
>   				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
>   					  igt_crtc_name(crtc), plane->index,
> @@ -285,6 +288,9 @@ static void run_colorop_property_tests(igt_display_t *display,
>   			}
>   		}
>   
> +		igt_plane_set_color_pipeline(plane, NULL);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
>   		/* only the fb created above needs to go away here */
>   		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>   			igt_plane_set_fb(plane, NULL);

Come to think of it, this will also need a commit (To be added with 
patch 4?). Because we need one for igt_plane_set_fb(plane, NULL) to take 
effect.

We will end up with

igt_plane_set_color_pipeline(plane, NULL);

if (plane->type != DRM_PLANE_TYPE_PRIMARY)
     igt_plane_set_fb(plane, NULL);

igt_display_commit2(display, COMMIT_ATOMIC);

if (plane->type != DRM_PLANE_TYPE_PRIMARY)
     igt_remove_fb(display->drm_fd, &afb);

which is a bit ugly but may there is a better way.

==
Chaitanya

