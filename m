Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E4FC0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 09:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF7C10E90C;
	Thu, 30 Jan 2025 09:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxPLFPiG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6F610E90A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738229296; x=1769765296;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=3gox4vYVBZthjv26udd3rYd4zUXviXTBLYo+egwWvAM=;
 b=NxPLFPiGb9iCbjGJluDw5rgb1EsSc9U/aydZqQLdWqOZzNSQwRU4RlDI
 EbxQ6/8PzfzxUMbnKfO47w6tIzVbuM9RXiY8RUxzLeWZ4Guu6hlqlpP5t
 GkydnNGqfddc0ZBfTQPwNEA+I11sizCYCMswglLZ3OHhoYFTTTOwkzl5t
 mc2wEFq6xYnR6M5/qP6+KG0auOjtBxIW2eZVEpy0YkBKqAP1c/0TXptvc
 Z/QryVryI2g9SwaylkJFhUsUYSDyvT0n7GoPkMZA55S0A5pW+7szV/QfI
 2BmkQGa09KyAxb9eRirdcACt8ffzYGgP+D2IoszErYvCJU4tw0dmx0Nis A==;
X-CSE-ConnectionGUID: DMb86rhDTH2oHsd9bqGMCw==
X-CSE-MsgGUID: SuEtscKvQUG0/vEPMspuMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="50149179"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208,217";a="50149179"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 01:28:16 -0800
X-CSE-ConnectionGUID: 3gmmmAyhSou9yqP/HCiusQ==
X-CSE-MsgGUID: vWBUbHfUSwOhkXa4UG+K/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="146476458"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 01:28:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 01:28:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 01:28:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 01:28:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsByRPrlgbpq9ydxcOda+R4jEf49fCBIBBhLXy8QVbdhH6UzncHi/LgCmp2hIyrvYrXGZo+prYQ6HxXeosaNx0GcDHe/efG+xI3Yyw3rdi8yQrctMEYG549pzwnNj9cybdAE0NvvOieiz4U2wEdOb8aYDdcs4y7YahMj4gPKlcIz7q7sImvQWGEB22VI6S38BGtyg++aI6cN8H/jGKKl5+rYrBvGhpTwOHpMP3cVnX2IzbiGZHiW1Hr2217ruBF5g53BIrD7mnX5EHyGGE1Jf7Xin1A/314nUknhHYQ6lQq0VXAwugs1RPKH753cal5EATfTSRB0eAusV5C+MLXbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi8d0+LKzpztQZqiqGI1rF0psBXUsXn1gPvFw4kstNY=;
 b=I78RNaZdgq3Ola/3vzGmJfeNWPBn90jf1xrs2cQ+4ZnLcny9lPffAhRQbRKBHNt6QZ0a/OomgQPWF7IwZ6z6/Sh1sS9ON7JRUVW26/GVhu48aNYYlq0ECV11HjuxhGsVBL3EiziUXP9L2q4gMhx2UDrW7EL/Q4/c2Bi435a6XKFk5/D+JzH2PEI75wfksEFRNWwmAl78CXMo3fRekRpmGG8tz0QMSQWRhw4go93+rZmlcr4axFQu/OzfbVJRd9h+vZsED78ZSEJHK7U2bglPcW9YR2lbFoAw5ObgVtvdR+z55OeBH3oNUy8ico9xqOtBRqvt/79voSny1yefx7GORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by SN7PR11MB7708.namprd11.prod.outlook.com (2603:10b6:806:352::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 09:27:43 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 09:27:43 +0000
Content-Type: multipart/alternative;
 boundary="------------Pt4ZnVcoli9XqZEevDnUAMKh"
Message-ID: <ec4352da-7232-41ab-890f-04a3dbdd4a80@intel.com>
Date: Thu, 30 Jan 2025 10:27:38 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy94ZV9l?=
 =?UTF-8?Q?udebug=5Fonline=3A_breakpoint-many-sessions-*_add_delay_before_re?=
 =?UTF-8?Q?sume_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20250127121001.58202-1-maciej.patelczyk@intel.com>
 <173801602848.1600141.15610831088344652909@b555e5b46a47>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <173801602848.1600141.15610831088344652909@b555e5b46a47>
X-ClientProxiedBy: DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|SN7PR11MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fef896-4f7a-45c1-5659-08dd411058c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlR0MVBOYStJdkt5bzdKaVdoSlUwNGpsSUJPTXV0TUd2dllNSTdlVklaaVdG?=
 =?utf-8?B?cytRZHNPRGh5bExYcVNGTkcxNExQSG5HMEQ3OENEYURET1pISmxTNHhSUHh4?=
 =?utf-8?B?c3lLdFlFbE1DQUI4alVnYlJJMzJQR1huRmtMSkYxTmxCcmozWXZZRHJCR0cw?=
 =?utf-8?B?b3JqQzlnQjFoUUFGQnlROGgrYWJqZGo5NzNRbUFZc0Z6T2M3ZGFxVzNIZGs0?=
 =?utf-8?B?bE1Zd2tqL0tFc3BMa1Rwd1k2MEwxdDIwU0tET1grZnhsZ2YvRk4xUXBhMEZz?=
 =?utf-8?B?MndpNmFEZHk4WHJpd00xUVVRcVB4RnZGc3YyZjkvWUZzcTNYaGtFUE4zbVFY?=
 =?utf-8?B?ditqZmhqSDlkNk1Eakp2aW5NNksrTjlXOU9LNkFKRE5PTkU0NFlQd3gvNElp?=
 =?utf-8?B?UWdSbVlYWXpFY2MrU2dNRXRTQkczbkVmRWtXd21IMW9PT29OY2d4WWlOTDJ4?=
 =?utf-8?B?R21MZ0dGcU9LczU3dFlXYTgwNEMvRHRoelhOK2JJSGI1M3FYV2xBdUVkUGR0?=
 =?utf-8?B?ZVIrU21uSjBtL3RzajNySlM4VVNMYVhmNFl3YmdKUFB6V1dvWk1uTGJ2K2tR?=
 =?utf-8?B?WnVsVG4xTER3T0NNelFvUGF4QldRYmordFJLUlN2VUNSbVYyMU1WK2lXek9F?=
 =?utf-8?B?RHB0Vmp4VHhMZFNDaEx4RHh0aUZ2MU9CUy9Ra1p4dkNhUXR6MThEMXVuazZ6?=
 =?utf-8?B?TXhNVEZDOXN2Z3FadEZhU1ptclhkQ2IvTFhSNE5zUVYrcFFsd2xlcDVGYXUy?=
 =?utf-8?B?a3dwdTg4dWsxVUZqejh4eHVwV1ozWkUzL0tjaU5QZlNRZGFsekVLQk1SNWhM?=
 =?utf-8?B?SFVxU1VUbERqWnVFYURJak9pYVBrT2ZmN2UxakJFZ05xdW80RHI4a2prS1Zm?=
 =?utf-8?B?cHBBYnBqQjRDeFBqV25YcjVjNXhEa3VzcjdZVjc3QzRiSkpZd1dHQ2NtYWUy?=
 =?utf-8?B?dVd4WnRDODVrSkV0U0J0RStnMW9vaGFORmVjRXQ5ckhtREhsdVEyVFhlRUZv?=
 =?utf-8?B?WXh2VzlQUzVzSFR4d1I4SlE0UEpCS0hidkJXam1POGFsczNhb2xxeDBTdFRt?=
 =?utf-8?B?MzcrQ0lHdEZVYWwxZyt4TUFISU9LSWJ5M3oxMUpDRGtMcW0xSUkrQ1hJb25V?=
 =?utf-8?B?RjBRajhBcm5RcDNqRFpZZkJpb3MrSHhGaVlPTXo2ckd1cmgzZGZ3QXhOUm8x?=
 =?utf-8?B?Q2wxemt6UDZleXNEdnpiNjZCOVhVTkhFU1JFVDZRNlVDZW55RHVjWjJXME0x?=
 =?utf-8?B?RElITEMxNkp0d2t3QUhNUC8zbTh4bDZTRDBMa1ZjaDRzcVNmN1FkME8yL0hQ?=
 =?utf-8?B?MlMyQm14ckxZRms4cTNNckJDRzVWTCtmejdxSWFHSnNLK3ZXQXZSWjd6clVD?=
 =?utf-8?B?VXZXNkQ0dnZwWm9WdmZjekdlRFMvam9VVEdGZjRLRW9vMzgxanZnNGNqMFJa?=
 =?utf-8?B?MHJkMmpINnl5d21NaW5rMWU5dFJyQWp3Zjh6bUVNVVV0V1lCYmtFeHFPMWdm?=
 =?utf-8?B?STJZbFRYckxmQVVGSXFZU1FWOXkvTnR1SjhrVldiQ3paaGZheDltRmxZSW9y?=
 =?utf-8?B?WklnNU85SDc3ZDFhbnQ4NGlFR1pNV0J3cjlFRno4USs3TTNkRVBnbjBxSno0?=
 =?utf-8?B?dU5IWTFHOU41UG9YTWdIN2MrdU51ZllZRXdERFhrUTdOajNEdEttVW5ORXV1?=
 =?utf-8?B?K2R4SzZnVU1XYVVTZm4zdi91NFA3VUtiWWxxVFF2UUZOeFVyZU9nWkEwQ3c5?=
 =?utf-8?B?TFRhOUFtTlZtQnBhaEhoems1dTM3OHA4ZUtzaE5xcE5id2MxRlVseHlZQlVz?=
 =?utf-8?B?dXRld2twYTVQYXduOGxoZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UitoSEJoS2FoSzVhS3d2TVRRTHJleTd6RjVQMTMzNlNEeGY2SGVFalpvSS9U?=
 =?utf-8?B?bFBHbG5EczJsNlFhRitxcFZxSVpoYmx0ZWxDM1VHSVlEM3F5OVpHMzFmaTBo?=
 =?utf-8?B?aEc4L2VhODV6eUpvZENBRVkwVWo2SVBpa3B1M0lZNXJPSkpwbnp2RWNmcHAr?=
 =?utf-8?B?Vy9pUjZSZ1lnenNtaW0vMUNMMk1UZWhuY2Q2WnlXejA1TVU2Y3EvcHlqOG43?=
 =?utf-8?B?RVlJMVE4cWxHeGNKTzcydHMzZlo2WWVXMWNkUU9GWkJzbWFrU01KUlZ1ZGRZ?=
 =?utf-8?B?dEJhVnp5Q1pnd2RtSlB0T1JWSE5lTUkyYzU3dlU5VXM5ck1JVDZ3U0I4MklX?=
 =?utf-8?B?U0dOZjhWczRWM2IzaWMzcWQ4OExCVWUwNlg0VW1hQzQwMERXTHloVXZwVU5y?=
 =?utf-8?B?ekpWQnh1N3pwMWpYVXM3MEUrQklJd3Y0eXcxUHhUTTg4Vkt2RCtvdk1kY1E4?=
 =?utf-8?B?a2JuTkUwNWI3TnJSUzRTbVE0VmJXS1Q2VVZmci8wWkowR2NyTVEwSzlNdU9N?=
 =?utf-8?B?cDYwWCthMEVXaU1aRjFwWHp6UUt2N245UTZ3ZlVtZExKeHJtWEpwbit2ZlU4?=
 =?utf-8?B?bkhsd3N6ak9YVEpkUXZoL3lTUlNTVy9QdjdZK3N3dlpFSEdhc09iOW9YcEln?=
 =?utf-8?B?TDNta0pGSnlmOXlSK0NWRHRWN1dqYTVzUVo1ZzJmMTA5REplZjF0VGtDKzZT?=
 =?utf-8?B?Tit1d0lvcU14cHRYdWJEU2lub3V6bFYzZ1dIdWhKdFFHZGJ4elA5NUZyZVJX?=
 =?utf-8?B?NU4vNmNWMzFFSWRlZGhtNHRuWmtFak15M1A4MkhzYmxaSVdxRlBlaW41QXpZ?=
 =?utf-8?B?MThrb1BLYkpmYjJUMzRuOUFPS2h0WllnTzhySWRzNW1aUnd0c3dsM0ptRXFN?=
 =?utf-8?B?MHU3YlpLOHBOY2RGZ3lhRWh3TERBb2pWcE1veFpUaTdlMUphVWhnUm1jK0xm?=
 =?utf-8?B?SXFMSWx5Y2k5L0FWdVFJOWswczhFZk1FalJHdmFTTVIzNmViaWxYU0RiZ3d2?=
 =?utf-8?B?SkhpaG5tWStoK0JCWHJyOTRuWjc1SGVwVTJSUmNJcGZya2lMUVpmVjBjUXUv?=
 =?utf-8?B?QnRncGJnZFVrNG15WmpKUTVoUm9hZTFaNGdPcTNlZTIrWFB4SjNpalJpNmxC?=
 =?utf-8?B?UWlVYTJDMWZHWVREM1ptc2I3cTR6RGZDVElvTTBGT2xZUXpUWWNMUFA1SUtF?=
 =?utf-8?B?VWtHZGVxaTJPeUZNc29IQXMrR3FZYnVBTlMzb01VNmZ0U2Q5YUE4QVFISFBT?=
 =?utf-8?B?NXZGUjdRQXpOYkhjQ0ljeTJlTFVPcmh3dFR3aTM4dlgzU2NkYWZaM2JtdTFZ?=
 =?utf-8?B?QmJNS082dDZKVFUvRzlQR2Fheit4M1d4Zmt0b1F5YjRCNXJFR2xRSDk0aC9D?=
 =?utf-8?B?b210Mk1wVWwzZEtqVlhHYUc0RGdlSWNtcXpxYVZiUFdaakNNMmpUZFc0VmJ2?=
 =?utf-8?B?MFhVT2ZGMXRYMFNiUEVNMG9HVFltdTVZTHpJV3d0NDFYc2FwLzBkL3hyb2p3?=
 =?utf-8?B?OHU2SnFNVk1OcGdnYUNFcDJWeE1aYUlMZlg3UkNZd252emVIVDdVZmZVdmFz?=
 =?utf-8?B?YUlLTjJ2akFCR2FNdVdLeEpKK1lDQVpQSTYwUytraVdDdkJSWVhZbGU4bjFT?=
 =?utf-8?B?VFJla2lQQkdoNG5ZOEtjcmt5QlcvdDdFSlpkY0tVSEZDZHk4Y29sS0lnMlA2?=
 =?utf-8?B?L3ZUem52MVRWeTRjZGJobWJWZDY4Ni9pK0RxQW53Qk5lU1NMMnV6NEZjMGhi?=
 =?utf-8?B?eE5neXBpNjVPYmNCOGl1R0xRblZiM0xyMWkyOVRCR1RWNkNERExQY3ZTRGgr?=
 =?utf-8?B?OTBKU0sxTi9uSTF0a2lNOFp0d1M2aEFXYXFvYncyQ0graU9XaGU1UTJMWkZE?=
 =?utf-8?B?RzFNbS9jVzQwOVVPWEpWTkFlbDlRY0Z4WEx3cXd4dWVCcHNlYWJ1ek56bE5D?=
 =?utf-8?B?cDFjN3I3SEdWaDZ1QzhzcVp3OXdIVjZwQXo4RFFhRXUzUVlzbG1XRU5LYUsx?=
 =?utf-8?B?OFNiWkN6M2UzN2pMOFgyeWgrS1RaSU5mdURuVkpRaE1vempKQ0t0RDhaaktv?=
 =?utf-8?B?aFpUUnBVZTg0NEZFWTdVVHE2YWRoa1llTUcyV3c3T0x0VDVleFNjbVJkMEcz?=
 =?utf-8?B?UDc1Y0dwSWNSbzUrZmoyNGR0eTluUmdkVlhYcDNTVGJObXhGMEV4d2ZqVFp1?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fef896-4f7a-45c1-5659-08dd411058c1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 09:27:43.0547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAGZkJtAbNwAOC94VnGwpxddWX+uO7MjyOx12K5WPizPPQ9Mjb0mrA6uRZOOMOY7Xm52gLKOhQHDvyu5xCibI/IWLCphjDdw8OYRAW6gLMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7708
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

--------------Pt4ZnVcoli9XqZEevDnUAMKh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 27.01.2025 23:13, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_eudebug_online: breakpoint-many-sessions-* add 
> delay before resume (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/143924/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/index.html
>
>
>   CI Bug Log - changes from XEIGT_8210_full -> XEIGTPW_12498_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_12498_full absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12498_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12498_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@b-hdmi-a6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a6.html>
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         +2 other tests dmesg-warn
>
The scope of the change is limited to xe_eudebug_online.c and a single test.

Those failures are unrelated.


Regards,

Maciej



>  *
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_12498_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_getversion@basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@core_getversion@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@core_getversion@basic.html>
>         (Intel XE#3440
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440>)
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +6
>         other tests skip
>  *
>
>     igt@fbdev@eof:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@fbdev@eof.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@fbdev@eof.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>)
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@intel_hwmon@hwmon-write.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#1125
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>         +21 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +15
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (Intel XE#3442
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124> /
>         Intel XE#4010
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124> /
>         Intel XE#4010
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +10 other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#1152
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-75:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_content_protection@type1.html>
>         (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-256x85:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +5
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x32:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) +6
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html>
>         (Intel XE#3383
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383>)
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_dp_aux_dev.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_dp_aux_dev.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +4
>         other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +6
>         other tests skip
>  *
>
>     igt@kms_flip@bo-too-big-interruptible@a-edp1:
>
>       o shard-lnl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@kms_flip@bo-too-big-interruptible@a-edp1.html>
>         (Intel XE#1504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip@busy-flip:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_flip@busy-flip.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_flip@busy-flip.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +9 other tests skip
>  *
>
>     igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp2:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp2.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>)
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>)
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>  *
>
>     igt@kms_flip@wf_vblank-ts-check:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1
>         other test fail
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@a-dp2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check@a-dp2.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +4
>         other tests fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +9
>         other tests skip
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +19
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_invalid_mode@clock-too-high:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html>
>         (Intel XE#1450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> /
>         Intel XE#2568
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568>)
>  *
>
>     igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-7/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html>
>         (Intel XE#1450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450>) +2
>         other tests skip
>  *
>
>     igt@kms_lease@possible-crtcs-filtering:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_lease@possible-crtcs-filtering.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +3
>         other tests skip
>  *
>
>     igt@kms_plane@pixel-format-source-clamping:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_plane@pixel-format-source-clamping.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#2566
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566>)
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@invalid-num-scalers:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_plane_scaling@invalid-num-scalers.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_plane_scaling@invalid-num-scalers.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>)
>         +18 other tests dmesg-warn
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>         +19 other tests skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2029
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029>)
>  *
>
>     igt@kms_pm_rpm@cursor:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_pm_rpm@cursor.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_rpm@cursor.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>  *
>
>     igt@kms_properties@connector-properties-legacy:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_properties@connector-properties-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>         +98 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +4
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@pr-primary-page-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_psr@pr-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_psr@psr2-no-drrs@edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-6/igt@kms_psr@psr2-no-drrs@edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_psr@psr2-no-drrs@edp-1.html>
>         (Intel XE#3924
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924>) +1
>         other test fail
>  *
>
>     igt@kms_psr@psr2-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +5
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +3
>         other tests fail
>  *
>
>     igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3:
>
>       o shard-bmg: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>)
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#2159
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1
>         other test fail
>  *
>
>     igt@kms_vrr@seamless-rr-switch-drrs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +1
>         other test skip
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters-userptr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html>
>         (Intel XE#3889
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889>)
>  *
>
>     igt@xe_eudebug_online@single-step:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@xe_eudebug_online@single-step.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug_online@single-step-one:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@xe_eudebug_online@single-step-one.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +5
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-large-cm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@xe_evict@evict-beng-large-cm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_balancer@many-parallel-userptr-invalidate:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +237 other tests skip
>  *
>
>     igt@xe_exec_balancer@once-parallel-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +28 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-userptr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +4
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_live_ktest@xe_dma_buf:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@xe_live_ktest@xe_dma_buf.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_live_ktest@xe_eudebug:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> /
>         Intel XE#3026
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026>)
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) +2
>         other tests skip
>  *
>
>     igt@xe_mmap@pci-membarrier:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@xe_mmap@pci-membarrier.html>
>         (Intel XE#4045
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045>) +1
>         other test skip
>  *
>
>     igt@xe_module_load@reload:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_module_load@reload.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_module_load@reload.html>
>         (Intel XE#3546
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546>)
>  *
>
>     igt@xe_peer2peer@write:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_peer2peer@write.html>
>         (Intel XE#1061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s3-vm-bind-userptr:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) +1
>         other test dmesg-warn
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-5/igt@xe_pm@s4-basic.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@xe_pm@s4-basic.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@xe_pm@s4-multiple-execs.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-vm-bind-prefetch:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#2280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280>)
>  *
>
>     igt@xe_pm_residency@gt-c6-freeze@gt1:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt1.html>
>         (Intel XE#3088
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088> /
>         Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) +1
>         other test dmesg-warn
>  *
>
>     igt@xe_query@multigpu-query-invalid-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_vm@large-split-binds-536870912:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>)
>         +51 other tests dmesg-warn
>
>
>         Possible fixes
>
>  *
>
>     igt@core_setmaster@master-drop-set-user:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html>
>         (Intel XE#3249
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html>
>  *
>
>     igt@fbdev@pan:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@fbdev@pan.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@fbdev@pan.html>
>         +1 other test pass
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-180:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-180.html>
>         +23 other tests pass
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124> /
>         Intel XE#4010
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html>
>         (Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124> /
>         Intel XE#4010
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html>
>  *
>
>     igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html>
>         +26 other tests pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html>
>         +9 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#2955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html>
>         +108 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@a-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         +57 other tests pass
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         +3 other tests pass
>  *
>
>     igt@kms_sysfs_edid_timing:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_sysfs_edid_timing.html>
>         (Intel XE#1174
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_sysfs_edid_timing.html>
>  *
>
>     igt@xe_pm@s2idle-vm-bind-prefetch:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>         (Intel XE#1616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616> /
>         Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@xe_pm@s4-mocs.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#2280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@xe_pm@s4-mocs.html>
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html>
>  *
>
>     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html>
>         +240 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#2233
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         (Intel XE#3225
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-180:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>         +10 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +1
>         other test skip
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>         +12 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +4
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +22 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>         +19 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#3442
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2594
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +8
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +8
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_content_protection@atomic.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_content_protection@legacy.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_content_protection@uevent.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +5
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-64x64:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +5
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_display_modes@mst-extended-mode-negative:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (Intel XE#2323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +2
>         other tests skip
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +1
>         other test skip
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#2372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#2375
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#2374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_flip@dpms-vs-vblank-race-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>)
>  *
>
>     igt@kms_flip@wf_vblank-ts-check:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +6
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>         +34 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +35 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>         +19 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#2350
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +44 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>         +37 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +2
>         other tests skip
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +2
>         other tests skip
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#2934
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2934
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#2493
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_pm_backlight@fade.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +2
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#2391
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#2392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2505
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>         +11 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +7
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>  *
>
>     igt@kms_psr@fbc-pr-sprite-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-plane-move.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +3
>         other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-plane-onoff:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_psr@pr-sprite-plane-onoff.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>         +17 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-move:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_psr@psr2-cursor-plane-move.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-move.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234>)
>  *
>
>     igt@kms_psr@psr2-sprite-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>         +18 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +2
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-rotation-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +3
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#2450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_vrr@cmrr.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_vrr@flip-basic.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_vrr@flip-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@kms_vrr@flip-basic-fastset:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +2
>         other tests skip
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_vrr@lobf.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_vrr@lobf.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1
>         other test skip
>  *
>
>     igt@xe_create@multigpu-create-massive-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html>
>         (Intel XE#2504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504>)
>  *
>
>     igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>         +12 other tests skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html>
>         (Intel XE#3889
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html>
>         (Intel XE#3889
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889>)
>  *
>
>     igt@xe_eudebug_online@interrupt-other-debuggable:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@stopped-thread:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@xe_eudebug_online@stopped-thread.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +13 other tests skip
>  *
>
>     igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>         +10 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +10 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +3
>         other tests skip
>  *
>
>     igt@xe_oa@oa-tlb-invalidate:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#2248
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) +3
>         other tests skip
>  *
>
>     igt@xe_pm@d3cold-multiple-execs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pm@s3-d3hot-basic-exec:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_pm@s3-d3hot-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pm@s3-vm-bind-userptr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) +1
>         other test dmesg-warn
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-extension:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +4
>         other tests skip
>  *
>
>     igt@xe_sriov_auto_provisioning@exclusive-ranges:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1
>         other test skip
>
>
>     Build changes
>
>   * IGT: IGT_8210 -> IGTPW_12498
>
> IGTPW_12498: f5223ff0286b69e8b6efe10f258c3c7bbe318240 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8210: 6ccdcffdb1aa67cf90a3f9cae99502ae327de57a @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132: 
> 9606e7472e23df21b5a4ad0c4845643eed592132
>
--------------Pt4ZnVcoli9XqZEevDnUAMKh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27.01.2025 23:13, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:173801602848.1600141.15610831088344652909@b555e5b46a47">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe_eudebug_online: breakpoint-many-sessions-* add
              delay before resume (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/143924/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/143924/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8210_full -&gt;
        XEIGTPW_12498_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_12498_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_12498_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_12498_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a6.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html" moz-do-not-send="true">DMESG-WARN</a> +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>The scope of the change is limited to xe_eudebug_online.c and a
      single test.</p>
    <p>Those failures are unrelated.</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Maciej</p>
    <p></p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:173801602848.1600141.15610831088344652909@b555e5b46a47">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_12498_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_getversion@basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@core_getversion@basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@core_getversion@basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440" moz-do-not-send="true">Intel XE#3440</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@core_hotunplug@unbind-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@eof:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@fbdev@eof.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@fbdev@eof.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send="true">Intel XE#2134</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>) +2 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125" moz-do-not-send="true">Intel XE#1125</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send="true">Intel XE#2191</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send="true">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442" moz-do-not-send="true">Intel XE#3442</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send="true">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010" moz-do-not-send="true">Intel XE#4010</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send="true">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010" moz-do-not-send="true">Intel XE#4010</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_cdclk@plane-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152" moz-do-not-send="true">Intel XE#1152</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-75:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278" moz-do-not-send="true">Intel XE#3278</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383" moz-do-not-send="true">Intel XE#3383</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_dp_aux_dev.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@kms_flip@bo-too-big-interruptible@a-edp1.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504" moz-do-not-send="true">Intel XE#1504</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@busy-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_flip@busy-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_flip@busy-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send="true">Intel XE#2882</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@a-dp2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check@a-dp2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send="true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send="true">Intel XE#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450" moz-do-not-send="true">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568" moz-do-not-send="true">Intel XE#2568</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-7/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450" moz-do-not-send="true">Intel XE#1450</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_lease@possible-crtcs-filtering:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_lease@possible-crtcs-filtering.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_plane@pixel-format-source-clamping.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566" moz-do-not-send="true">Intel XE#2566</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@invalid-num-scalers:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_plane_scaling@invalid-num-scalers.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_plane_scaling@invalid-num-scalers.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>) +18 other
              tests dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029" moz-do-not-send="true">Intel XE#2029</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@cursor:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_pm_rpm@cursor.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_rpm@cursor.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@connector-properties-legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_properties@connector-properties-legacy.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +98 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-primary-page-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_psr@pr-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-no-drrs@edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-6/igt@kms_psr@psr2-no-drrs@edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_psr@psr2-no-drrs@edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924" moz-do-not-send="true">Intel XE#3924</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899" moz-do-not-send="true">Intel XE#899</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-3.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_vrr@cmrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168" moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159" moz-do-not-send="true">Intel XE#2159</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889" moz-do-not-send="true">Intel XE#3889</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@xe_eudebug_online@single-step.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step-one:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-8/igt@xe_eudebug_online@single-step-one.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-cm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@xe_evict@evict-beng-large-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +237 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@once-parallel-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +28 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_dma_buf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@xe_live_ktest@xe_dma_buf.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_eudebug:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-send="true">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026" moz-do-not-send="true">Intel XE#3026</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@pci-membarrier:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@xe_mmap@pci-membarrier.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045" moz-do-not-send="true">Intel XE#4045</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_module_load@reload.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_module_load@reload.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546" moz-do-not-send="true">Intel XE#3546</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_peer2peer@write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061" moz-do-not-send="true">Intel XE#1061</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mocs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@xe_pm@d3cold-mocs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-userptr:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569" moz-do-not-send="true">Intel XE#569</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-5/igt@xe_pm@s4-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@xe_pm@s4-basic.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-prefetch:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-userptr:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280" moz-do-not-send="true">Intel XE#2280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088" moz-do-not-send="true">Intel XE#3088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-send="true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@large-split-binds-536870912:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) +51 other
              tests dmesg-warn</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_setmaster@master-drop-set-user:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249" moz-do-not-send="true">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@pan:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@fbdev@pan.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send="true">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@fbdev@pan.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-180.html" moz-do-not-send="true">PASS</a> +23 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send="true">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010" moz-do-not-send="true">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send="true">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010" moz-do-not-send="true">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html" moz-do-not-send="true">PASS</a> +26 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send="true">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html" moz-do-not-send="true">PASS</a> +9 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955" moz-do-not-send="true">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html" moz-do-not-send="true">PASS</a> +108 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-send="true">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">PASS</a> +57 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send="true">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sysfs_edid_timing:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_sysfs_edid_timing.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174" moz-do-not-send="true">Intel XE#1174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_sysfs_edid_timing.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616" moz-do-not-send="true">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-prefetch.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@xe_pm@s4-mocs.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280" moz-do-not-send="true">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@xe_pm@s4-mocs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html" moz-do-not-send="true">PASS</a> +240 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233" moz-do-not-send="true">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873" moz-do-not-send="true">Intel XE#873</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225" moz-do-not-send="true">Intel XE#3225</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send="true">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send="true">Intel XE#610</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +1 other test
              skip</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send="true">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send="true">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send="true">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862" moz-do-not-send="true">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442" moz-do-not-send="true">Intel XE#3442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594" moz-do-not-send="true">Intel XE#2594</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send="true">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@degamma:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_chamelium_color@degamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_chamelium_color@degamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_chamelium_color@degamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_chamelium_color@degamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_content_protection@atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390" moz-do-not-send="true">Intel XE#2390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_content_protection@legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_content_protection@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_content_protection@uevent.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188" moz-do-not-send="true">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-send="true">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@mst-extended-mode-negative:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323" moz-do-not-send="true">Intel XE#2323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_fbcon_fbt@psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776" moz-do-not-send="true">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_fbcon_fbt@psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776" moz-do-not-send="true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372" moz-do-not-send="true">Intel XE#2372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373" moz-do-not-send="true">Intel XE#2373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375" moz-do-not-send="true">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374" moz-do-not-send="true">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send="true">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send="true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send="true">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send="true">Intel XE#2380</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +34 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +35 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352" moz-do-not-send="true">Intel XE#2352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350" moz-do-not-send="true">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +44 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +37 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>) +2 other tests
              skip</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934" moz-do-not-send="true">Intel XE#2934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934" moz-do-not-send="true">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send="true">Intel XE#2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393" moz-do-not-send="true">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493" moz-do-not-send="true">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391" moz-do-not-send="true">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392" moz-do-not-send="true">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392" moz-do-not-send="true">Intel XE#2392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505" moz-do-not-send="true">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908" moz-do-not-send="true">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send="true">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836" moz-do-not-send="true">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send="true">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-do-not-send="true">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836" moz-do-not-send="true">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send="true">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-do-not-send="true">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836" moz-do-not-send="true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send="true">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387" moz-do-not-send="true">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_psr@pr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-move:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_psr@psr2-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-render:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_psr@psr2-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_psr@psr2-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414" moz-do-not-send="true">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-90:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330" moz-do-not-send="true">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send="true">Intel XE#2413</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450" moz-do-not-send="true">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_vrr@cmrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_vrr@cmrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168" moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic-fastset:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_vrr@flip-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_vrr@flip-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168" moz-do-not-send="true">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@multigpu-create-massive-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504" moz-do-not-send="true">Intel XE#2504</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889" moz-do-not-send="true">Intel XE#3889</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889" moz-do-not-send="true">Intel XE#3889</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@stopped-thread:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-4/igt@xe_eudebug_online@stopped-thread.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-tlb-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-436/igt@xe_oa@oa-tlb-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573" moz-do-not-send="true">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248" moz-do-not-send="true">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420" moz-do-not-send="true">Intel XE#1420</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mocs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_pm@d3cold-mocs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-2/igt@xe_pm@d3cold-mocs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-multiple-execs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3hot-basic-exec:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569" moz-do-not-send="true">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-7/igt@xe_pm@s3-d3hot-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569" moz-do-not-send="true">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-userptr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172" moz-do-not-send="true">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569" moz-do-not-send="true">Intel XE#569</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send="true">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-extension:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-send="true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8210/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-send="true">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12498/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +1 other test
              skip</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8210 -&gt; IGTPW_12498</li>
      </ul>
      <p>IGTPW_12498: f5223ff0286b69e8b6efe10f258c3c7bbe318240 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8210: 6ccdcffdb1aa67cf90a3f9cae99502ae327de57a @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132:
        9606e7472e23df21b5a4ad0c4845643eed592132</p>
    </blockquote>
  </body>
</html>

--------------Pt4ZnVcoli9XqZEevDnUAMKh--
