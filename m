Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D962C79FAA
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 07:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B4510EF9E;
	Wed,  9 Sep 2026 07:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkZd99bf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3AA10EF9A
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788940495; x=1820476495;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vrsliW33wOic3n3BjZZRn9JDxkCDAmICs1durRaX7mI=;
 b=TkZd99bf2BUjHWU419IjZeIoS8befm/Dam64Wkwxt71yEkzywMowq+1d
 CFJlf3RfY7KvmaS/nEtDBjC7FQZeNROCdMgUag5FiVzqgFonNTPMkuIFV
 fzLs1BNRCzOjx6YVz3OmGHtXnlpJhP09Yo4VXrYPD9G1Wb0K7tgC0RD+l
 OkI/nTMUUxFwMA2H/rPg54zq/9diArOWFHb8U6AazN1FdbfolrZlioZ/O
 ZQCKuqPyKEMbyXSArU6vNsY1LqWoa8ekNIubFkGT6MEaB+CyYSShS41t4
 263VUVv5vnv0jB6IJ88FYuWk2zb2HNyhLf6xkQy6cUATBEbYigU/jbduJ Q==;
X-CSE-ConnectionGUID: 79YantwESKW+OxXLMCwAXA==
X-CSE-MsgGUID: ISfige/bT4++YjKLZtQOrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93175909"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="93175909"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:54:55 -0700
X-CSE-ConnectionGUID: Fr5hasY7QnWsH/HxSQZoZA==
X-CSE-MsgGUID: cspcnm5wRouCVwAnCmMg5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275383795"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:54:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:54:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 00:54:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:54:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WO6aCVqHcwNvgI9iEz9RPgXNl9RsfDYzSkp1qEDnPOdYxFausyGL+Xp3t/rcbSlQ/FkJM+v3+PJA92FzwOgU1nycTj7995v53cSbvCFrBOF0kxWJuwu5Rw2zaQ761VeEj0YfFViH0KtkIZKMolYipm/FOoy2X26eGQe0mpeUjyQz1qw/MMfDe7lxPC4nROVQnaSaD934HbRPRVAIHW8QTY3Us2do2S4ub9AiXPa2rLTvZnL4/5yy3DqEWb7UA4RZtdRwlZsDHrgSSIGITsY0Mj2Z6FI9fT+yZSkcPGK9ebXX0Yb7V3VfNRLyF9caBI1cvknLHJ2Rug1C3ZptKQZQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=501xfF0GVyg90DNh0bnt0QOl2lTTCmkhfMgcNpvMPxY=;
 b=RUkpD4uQ39cZ1Q0vX3y2Rm9B6bFUxpaVkynkGB12V9VzI3L+RI2yVKjKT3TXOSmOeavqMR4O88ugxR0VlkrW1AR6+5euSOP5n+L2VrvgZlzqfBfMx6Z2VWVcRLf4uwLoRA43cRgLIA9ah/UNNvFHElv1ZsLcYnkKaqSPMFyLAULCylcAFfanR/aAEXE9xKK30DONWMp7vW7JZLaBj+fjTZwSGvmnKvc2+8RXamLmexmRGFBUAkG0hWGFVmuJoIoNv3CEGz6oSA8RqXKk6fhNtdgMmvIeDayTgbltWZ+YwDOFrUPNplYPHA0GBgK8rRw62lsTkc7h29QLlNCgbTUWDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:54:45 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 07:54:44 +0000
Message-ID: <6986b797-f223-4ea4-ba73-c94a96f70d79@intel.com>
Date: Wed, 9 Sep 2026 13:24:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 5/8] lib/igt_kms: extend
 igt_plane_set_color_pipeline to accept Bypass
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
 <20260902180016.303482-6-mwen@igalia.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260902180016.303482-6-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c7bb49-31a2-45dc-dfc5-08df0e479cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|7416014|376014|1800799024|366016|4143699003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: A3OORiJBhc6348Qb6nlh/ZzW77+MzFFbkVNH6mg01lfzlcSrJtg62R4nJ5+5S5WXTsSrfjKUCS6qvbHaGjGj9kKCfAKq6TDoxTvobMNkrOW+x22arSUHEiVQ8hNC0HXhSYa5+eCGIePBMBf07tjohofhdTZUUKXZNaz6XN+Pdy/XL4pcRhJwYYAkHN2/j1szY/r3WglVuPkXAAQeGHiXw5a3QDEV3Y8wPvl+sQ6LP9GZk9BkxTvaFDgiYSeLk3oiJ5kUBRINlNi0NsBrPNMk7iHvkZuAdQzbb4UMY1p6KF09wfVOc7BYwwmXXiT9S5F/kZ0xL3EtziYgR7Q0pTL/AsBsHO2tgVDKvoy0rWT5av5jyHcNSa9F2ADb0u4wLaV3muMetzRyliXMTr12uu3An2448mIzyVrOWZ0dB1hFlhYSGiE+45+LwCeSN/w+rH9C1WAIxptVvfaUPvIH8ErEkn5e0HEsBpOrsTRfd7nzZtMSRakXqx2LhO/fNVRGmsNEr08hbSt9nKwzIKBu8MzFkRNRm0Z2xHXb8bfRMLqhS5+6HdDERtvynvhxW0jInCze3I+ZmKZitB1hDUxEdTkBWdwDIEJyyjy7hSAemX/ymMl0Zmk+9XgqCrYOFHW+NiNJIn0Z6pL3bNYx2aGS//DsIzJBzLPLG3YXXrq1vcGfVOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajA0Y0ZqaldkR21WVXloS1F2MFFrZzFTYTlqNzR1K1lBa0R6Q1EzN1dHWlps?=
 =?utf-8?B?YWttcjVkejlLTTZmbVM3aG9IUlBHaUZQcHpUSi8zQUNXSFUwYmpsbjdzdlVr?=
 =?utf-8?B?am00dG9BQXppVGUyTC9qNmx0QXdIR3FqdkwwZ0JjUVpaWmhlak1STjN0dGxu?=
 =?utf-8?B?WmUzV0hCWnRJaEtVMERodnNSTmY4dElTTWdnaFBsM1FtWUZDUWRkcUg2QUFH?=
 =?utf-8?B?ejdqaUNTUHpENTF1NXVmUGIxQWR0SGJ2ZUs1WXpta1lpM25GNUttcW94eW9E?=
 =?utf-8?B?WTM3V2ZmdFoySExERkZrUEcwaUg2S2JTOGlEcm4raWZhTS9DMnNMRnJaVDd5?=
 =?utf-8?B?azc1RVYzV0FWRFQxZlRUb1FjS2orK1IrckpPZkhlMGJDUGxzMVdpaXd0Kzgz?=
 =?utf-8?B?OHVMTWFBcjNmYkZyaUl2RkNLZitoVDlYMTdXQnNvRmYrN3k4WjlwaUMzRmpj?=
 =?utf-8?B?ZzM4UHAzWk1qOGtuM2pUb1hnS3lQZzQwUVlqbklEY0NlUWJKcnBVcStnM1M0?=
 =?utf-8?B?L2JJb1lsaWQwZlFuN3BxSC9QbjdObXdXV0s2cTZxeEx3TzdGQmZaTGNpNXQz?=
 =?utf-8?B?eEZRZktDc1pueS9xV0wwa3NFemNRMWVTOEtkTUFLb3Fka050Y3ZWTEk4a3Jl?=
 =?utf-8?B?NkFaemxVREtSSitpZE5zcmFUK2VTYXBFTkJZa1cwKytoeVJsYUkvTk0yejFR?=
 =?utf-8?B?LzN1VTI0S3ZkcitBK2twMlRmQjA2ZlRxandhZmlhNjMzMHZHOW42RE0zZlZN?=
 =?utf-8?B?Q0wySndCUmJUempxVEhZdkl0T3hDS2plL1ZpQjFSek5Bdkw2L2FJOHFOM3FG?=
 =?utf-8?B?d3dhcUtXTk9NOU5nZEozWnBsZDNEZUlZK0hNY1lRcVRCd3R6cWtZZGRGZUh6?=
 =?utf-8?B?UmN0dktaV3JtTGhYYlJ2Q3FJS01iRmZzdzNsaVpCeU5Xek5zVG1NWkFoU1dx?=
 =?utf-8?B?cEdSTXk2YW9hWDdLYUtUcGNVQ2pOamlRTVJEbE8zSEt4aUVnVXU1VUZpYmJR?=
 =?utf-8?B?KzdtWmRkMGU1M3pheG5xZ01yTDFDNnJScFV3MHhBNmFTOWJKTlg1Q2l2Njdn?=
 =?utf-8?B?R3pVbmxSbVB1TXhTRzBUT0VlTFpZVE4zdUJuL3duMHZJRTdYbUp4WjRaWk8v?=
 =?utf-8?B?bG16YmRXa016dktSV2RhN2Y0L29sNFVidmYrdFQyRWpQQnUveVdvME55Nk5p?=
 =?utf-8?B?QkFEb2dtUWlxeEplRGoxaWdjVlZ5WVJQdzZldUFNaGNVWU03ay84S2tIRXVI?=
 =?utf-8?B?TGtNL1FYWDFxL1F3RFN3VUhjSlFxbWZLbWNkNkpuc2pWZXVZRnpaRk5TWVRT?=
 =?utf-8?B?ZjVZamhpekdzdXpEOFZ1dlY3Y3JWL2NhYmt2ZkltMHUwZmVyVUo5TWFyV0t4?=
 =?utf-8?B?UldMRy8wZU44cWZCQ0VscldxdVUyT0hWS2dNYzc3dkRGK2FCbWpvTmlGb3hW?=
 =?utf-8?B?N1hpblNtRGtSYkxoYkd1aEU1VkRMcUJSS0JuSmV5cWJ0UDNBcEtCUnNqQUk2?=
 =?utf-8?B?N29hWmRNbmVsY1d0d3hQWnN1K1NzSlBYeVVqOXJkRUp2LzRsYmlXWk81d2p6?=
 =?utf-8?B?N1p6ODRNUnJhOXdZRitUcHJabkZjWTlkUElIeEpzTnI0TTkrbXVOZGY5QWtT?=
 =?utf-8?B?YVBnVElQSThlVFM2NVlDcTZ6WmZsY0srUmFxajJvdHFQUy9zR0RiSFE4UW0y?=
 =?utf-8?B?dXMrNlUrNnZIS2NiSHJHVWFBYks0MGYwY0g3cUdZUmVJUXEwaUZET0xuYXg5?=
 =?utf-8?B?eXVobDVVRStkT1hJSXNlL1JOWXRUMEhwUHV1M3g3Mko5SGRxSXpLTy9hZkwx?=
 =?utf-8?B?OFFTUFhWMmZrVU5MR2VmRHNuRmk3NG9WTnl0SVEyWVE4bTNZVXVFK29zeVhH?=
 =?utf-8?B?cit3d0lEOHBrWWdMMGJKeFpqdThCTkRtZlVlQUZvcXNQZXBCRG54UVNIeEF0?=
 =?utf-8?B?NXMvbU0rTmJBRk9Bd1l2UUw5eHdZdkFudkwxTHdoVStoMjdSOGxsOE12d2tQ?=
 =?utf-8?B?K2NXcU54aTdraCticnJiNmxBQStMdDNPS2g0WDVOeHNRd1VyOTlLRXRKQjJE?=
 =?utf-8?B?L1VVdys2SlVZNVl1WHk2OHpZaHJLc1FLY202N3dwVVVKUEJRM0ZKMCs4WFpX?=
 =?utf-8?B?R3JhY0VSSU5MYUNtWllhRHhRQngvYXpQTlFWbi81dTRSVEVJaE1rZGdJdWt6?=
 =?utf-8?B?U1hTN2FMNFVnYmdSOFhCckNEUHExdnJBOEpWV1R4S0ZGdEM0NzhMYkVkNGRK?=
 =?utf-8?B?RTM0QUtxWkM1aDZpTHBvZGgrcWdLRXA1NzFaM1UySVEzdDR3NEJqeHI4NGM0?=
 =?utf-8?B?TEJJUHdkS0lMcFp5c09Ka0lTVC9YTnlGUGdSTzQwR0dHYUdHS0FrbEt5UVB5?=
 =?utf-8?Q?la8yDrxP2zfPwdN4=3D?=
X-Exchange-RoutingPolicyChecked: LOTPPdwZTtyEmexeuJZNwgm38KplEueqYhTF3HB4pRVUlp7aBcTvqfW06hTnQcl3E55wg/aT9/3Ba+mb9BFBhy9m7mQLwme9sT0ov5CjIDqcuzgJmAoCJCqfZB1y5OT3kZY+GWcyt8C9EZIiciC6wKUhLje4DAowV5hysSbSb2pRRBHWpkJ7Jnsl+ZP939J2UTag2Z0lExxzgZn8PBqZOJItqctkwIl/QkvBtTDG7f7i7MJdTshdj4dpf/Zz1XRN7Mc4eKfHf1wAQ8nlbeu1Iv2XzqwscUsE3jx70ysShVeaxfsTLuTsLyNxffgaOEuF9N+dbhqlNu/XJGfQIRxpZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c7bb49-31a2-45dc-dfc5-08df0e479cba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:54:44.7954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znrDFhEgaeg9l5gxG7pZumx9wmSejfbmlIw6dJOlSFwwCAg6WgjSO/+zbWimu3mO2Sy3JLYYhetYDzSg7oKoBlx0JA02yFQcGUyR+f0QiVM=
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
> "Bypass" is just the COLOR_PIPELINE enum value with no colorop object
> behind it, so make igt_plane_set_color_pipeline accept NULL and set
> "Bypass" instead of making callers poke the property directly. Convert
> its callers, igt_plane_reset() included, and drop the now unused
> set_color_pipeline_bypass() from kms_colorop_helper.
> 
> Keep assigned_color_pipeline pointing at the outgoing pipeline when NULL
> is passed: the kernel accepts a colorop update whose pipeline is in the
> plane's old state, so reset_colorops() must still be able to finalize
> colorop settings in the same commit that deactivates them. No functional
> change.
> 

We still have a problem of assigned_color_pipeline never being resetted 
to NULL. But not a problem with this patch.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

==
Chaitanya


> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> v3:
> - new patch, replaces the open-coded "Bypass" setting in patch 6
> ---
>   lib/igt_kms.c                                 | 20 +++++++++++++------
>   .../chamelium/kms_chamelium_color_pipeline.c  |  2 +-
>   tests/kms_color_pipeline.c                    |  2 +-
>   tests/kms_colorop.c                           |  6 +++---
>   tests/kms_colorop_helper.c                    |  5 -----
>   tests/kms_colorop_helper.h                    |  1 -
>   6 files changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6039ad18a..cabe60a31 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2708,7 +2708,7 @@ static void igt_plane_reset(igt_plane_t *plane)
>   		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
>   
>   	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> -		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
> +		igt_plane_set_color_pipeline(plane, NULL);
>   
>   	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
>   	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
> @@ -4430,17 +4430,25 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
>   /**
>    * igt_plane_set_color_pipeline:
>    * @plane: Target plane.
> - * @colorop: Colorop to set as color pipeline.
> + * @colorop: Colorop to set as color pipeline, or NULL for "Bypass".
>    *
>    * This function sets the given @colorop as color pipeline on @plane, or fails
> - * the test if it's an invalid color pipeline for the plane.
> + * the test if it's an invalid color pipeline for the plane. Passing NULL sets
> + * the plane color pipeline to "Bypass" but keeps the previously assigned
> + * pipeline, so that pending colorop changes are still submitted with the
> + * commit that deactivates it, which the kernel accepts because the colorop is
> + * in the plane's old state.
>    */
>   void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
>   {
> -	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
> +	igt_assert(!colorop || igt_plane_is_valid_colorop(plane, colorop));
>   
> -	plane->assigned_color_pipeline = colorop;
> -	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
> +	if (colorop)
> +		plane->assigned_color_pipeline = colorop;
> +
> +	igt_plane_set_prop_enum(plane,
> +				IGT_PLANE_COLOR_PIPELINE,
> +				colorop ? colorop->name : "Bypass");
>   }
>   
>   /**
> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
> index db6107221..5738c6dd1 100644
> --- a/tests/chamelium/kms_chamelium_color_pipeline.c
> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
> @@ -161,7 +161,7 @@ static void _test_plane_colorops(data_t *data,
>   	chamelium_destroy_frame_dump(frame);
>   
>   	/* Cleanup */
> -	set_color_pipeline_bypass(plane);
> +	igt_plane_set_color_pipeline(plane, NULL);
>   	reset_colorops(colorops);
>   
>   	igt_plane_set_fb(plane, NULL);
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 78860a845..f71416ce1 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -168,7 +168,7 @@ static void _test_plane_colorops(data_t *data,
>   	igt_assert_crc_equal(crc_ref, &crc_pipe);
>   
>   	/* Cleanup per-test state */
> -	set_color_pipeline_bypass(plane);
> +	igt_plane_set_color_pipeline(plane, NULL);
>   	reset_colorops(colorops);
>   	igt_plane_set_fb(plane, NULL);
>   	igt_display_commit_atomic(&data->display, 0, NULL);
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 732b9d57f..2bee1eecd 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -287,7 +287,7 @@ static void colorop_plane_test(igt_display_t *display,
>   
>   	/* reset color pipeline*/
>   
> -	set_color_pipeline_bypass(plane);
> +	igt_plane_set_color_pipeline(plane, NULL);
>   
>   	/* Commit */
>   	igt_plane_set_fb(plane, input_fb);
> @@ -315,7 +315,7 @@ static void colorop_plane_test(igt_display_t *display,
>   
>   	if (!colorops[0]) {
>   		/* bypass test */
> -		set_color_pipeline_bypass(plane);
> +		igt_plane_set_color_pipeline(plane, NULL);
>   	} else {
>   		/* get COLOR_PIPELINE enum */
>   		color_pipeline = get_color_pipeline(display, plane, colorops);
> @@ -343,7 +343,7 @@ static void colorop_plane_test(igt_display_t *display,
>   	/* Test bypass transition if requested */
>   	if (verify_bypass) {
>   		/* reset color pipeline*/
> -		set_color_pipeline_bypass(plane);
> +		igt_plane_set_color_pipeline(plane, NULL);
>   
>   		/* Commit */
>   		igt_plane_set_fb(plane, input_fb);
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index da234410e..a109c1b06 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -450,11 +450,6 @@ void set_color_pipeline(igt_display_t *display,
>   	}
>   }
>   
> -void set_color_pipeline_bypass(igt_plane_t *plane)
> -{
> -	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
> -}
> -
>   static void reset_colorop(kms_colorop_t *colorop)
>   {
>   	igt_assert(colorop->colorop);
> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index 9a1477666..2a0e3799f 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -114,7 +114,6 @@ void set_color_pipeline(igt_display_t *display,
>   			igt_plane_t *plane,
>   			kms_colorop_t *colorops[],
>   			igt_colorop_t *color_pipeline);
> -void set_color_pipeline_bypass(igt_plane_t *plane);
>   void reset_colorops(kms_colorop_t *colorops[]);
>   
>   #endif /* __KMS_COLOROP_HELPER_H__ */

