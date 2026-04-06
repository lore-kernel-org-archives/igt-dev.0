Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444F6E9D831
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 04:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0E510E06B;
	Mon,  6 Apr 2026 04:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HK7cmN5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8B110E06B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 04:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775451416; x=1806987416;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hp8Wak/emnhREMp8WVVigjVj7utXsck2+rNV9OkgxEI=;
 b=HK7cmN5VZVmOsaKz+fP+tXlRP9PAy5ZFO3GJk01DzGU7qx4RupFYjYjG
 yMwvbCntirwprb6ADbPXLM6fVJdD5aVL/VBWWDEZPe1kzkBz8qnG+mRNX
 JZinlEAfMIaoXyu/lbIDgkQyxzdoTXZ7GXzYzRPF0rNk4kxIufeMluzJJ
 7qcrzxr+++CaZeWeVuir/UhraRYfFqdReSVUoedKvh+lJmJYppHiGFIM+
 vM0JoZDR1phYZ33KZ2UoHjKZ57Zh8cmRIhl0oYr22EyvffJV6+jGeHl4C
 n9/Ze0SAWru/gb7EyUSnisjdWS9meHCExgSwcDZgA5sGRanmIFISMIVYC Q==;
X-CSE-ConnectionGUID: DXpgge6QTj2mkkByrESY5g==
X-CSE-MsgGUID: +mM9t3P2SxSJRFjlPMmN0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80291207"
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; d="scan'208";a="80291207"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 21:56:55 -0700
X-CSE-ConnectionGUID: 6mMcTf6OTDy1nduo3tWzVQ==
X-CSE-MsgGUID: vLmVcD/pS8Sf63QUkM0MDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; d="scan'208";a="221194817"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 21:56:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 21:56:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 21:56:54 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 21:56:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcHhLFvEmgmFDBV2EXgXV3pUMpRBF1n++kRSa1r9MDdg5XYYYfttF6dfxaP4DlDn0KR3tDnB4GAXBQebc9hSWG1X66fvim3vF5Wriy7qh8XMGSC8e76Ou8+SoC8lZhw0fHePDgDlypCeat82KyMcO+7bWN7KY8f4WojVJzK2Nsw7mgzAmXJFlufKY3eT6TvxwxZ/dUlI83Ghpednc9huzomDYIP+zqlmrugtTep/57+FaYSwPedyxaEd8V+rZNUehzEU9RX992+fDF6gbsyQ8qgJ/Y/OJ1kvT30zwmiStAkHhwtuJSEXunNGcSe0AhlbdUX4GwOU5U0Ficq1VJVc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOx6YRjiVSHoYbSdWEMKiA8iEadL4GB6RrFsbruH91I=;
 b=oYO+cuFUe2uxky+ICq0YETQQ45qlKkh4BNEL9hbLiA3lk9YJE6gJ/jUmoN4/k0K2GZrclMR5qr48xvwBzyUusUESxYdZR3TjJIr1pKTpsTPGYEr20Q+vuedLx4j4vxQdKnhEwQ9tRUtEfDtPZ7Lu2wi/AAWNbwSx99k4wCZkZKuPyCeWpFrGWsSJelV3TK8iIRVP1nuYXPN8VIiCJUWqfju/cXIocuCkfmv/+1OyYMLKVNu8xDwyaTAued7Rg27DeCiZk+KM0RUlpj/01MlOc/gZ71B5sVyqmY14AB3Bm9Sb+CTJGCmWmUFlxT/Zvnus4A5QtvgEd1PL6IbM+KZpYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Mon, 6 Apr 2026 04:56:47 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 04:56:47 +0000
Message-ID: <14383743-685c-4d61-9c58-b1b563f588ab@intel.com>
Date: Mon, 6 Apr 2026 10:26:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: tools/gputop: Fix zero output when stdout is not a terminal
To: Vidya Srinivas <vidya.srinivas@intel.com>,
 <igt-dev@lists.freedesktop.org>, <kamil.konieczny@intel.com>
References: <20260402134522.108322-1-vidya.srinivas@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260402134522.108322-1-vidya.srinivas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0096.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::11) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DM3PR11MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: bf39a569-b0b5-4364-52b0-08de9398e822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 162jpw1Gnqq4dhDX80vrpYasD8+S2nssAJPA8sGiPjRFoNx/OtLuTOklzjXBkY23thpUXQ3OqLEztiOJSkLfHhvxpVYdHzww7pk35NLfihGjs9nD8woqo/T8DjUvA3VjNbvVmIvO9BLsXa8gULOTJqXM5SDC2sagfR53kg/oGJxj4sl9VwE/9Z49i4IofLr5+Skby09e3bd7wbru25a6aiLZqIAdH8PuqK+6RunJZKV4eQ1L7Mm7TZy1KfF0w8yjUbPgqgJTNtdFl1f3B52WCnwQ5HzfOhRUl0eD28nMT/xYgyV1oMo9t7X79LOhDY4I8R5cddzvgU/ukO/UC+uHAksIECM5u40UZHuV1X8lmd/AYgTsfvOtFjDdtdQrrDWsZZlwbws5e6KvSJeTcgsNqCLdltfTcPz0trp5EO2Ry6ZIlU009Z69wF3k8PYnw1rZcf0tW5neDG83wtnak3UhJjl26ksLqLqVjMQhheflnsvkyfeyLFwAcHTNOk9gQqiaeJYdfT56tVXF1PEurKllzBhW6GghEYC0CPA3aj4M2x6FOUTjd5xIHMUhk7OFhFSplVYbxZY+pvR8FL8gcQewKttyi1HgBf47dJRIz1oEA67J87Z50ZLvbUtCnVQ6MphXFswhn0SZ2HRfe1zLZNVKtfiLYsdtqeTxRNM07AJfPN9q4zvenndCDEf53CXEfvP77B3LML2wE9aeouvm6juSj9OuzoxN8j0T3TdZgQGbTJA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0NUWHNRT3pPb083L3ZhdlZ0R2tuTGlkcjRxbmFWR1kwUVp4eHU5TWYwWlIr?=
 =?utf-8?B?RUF1QnluRVR5cGtqYXJvaWhuT1F3QS9XclhqWFFtdHpjdEZudWtkTkI0UWZD?=
 =?utf-8?B?dG9meXk2M2JuY2pPS1crc0VHRnd6ODZJMmlJWGhTWjVYeU1Rci82TVA3SjFM?=
 =?utf-8?B?bHVJR1NBOFY0bFR1Mmordmx6RjRvN1J0RjdaL29PTWZUUFZxZ3NvYkZOdEtE?=
 =?utf-8?B?NC8vMzFqK3gvbVJVeEZFRmJWem85aEdWbE15UDNQdTlZbzZtbUdZdWFmVitN?=
 =?utf-8?B?SXExSjltSHVFdDlYWWFMOWVFVTAyVWNjdXZaYUVRWEl1Y2NrNEczWHRYVm1N?=
 =?utf-8?B?WTFCaHZsQ1pUYmliS0lxSnZiZkFGTnozbWNJdXZaYlJsQUhTOW81TzZiZnVi?=
 =?utf-8?B?N1JlbTZXL2xWdndPWUZIcFVENUttK0t5WDdjWVMzUUJDdWo4MEFnMzI1SFls?=
 =?utf-8?B?MmdUS3BEZlVXSGxDejFSenI4Y1hyUWNxTlhaTTlvL0o3czJSMVdVQmFBWUpo?=
 =?utf-8?B?aTFOR3prdjBNaE9iQUU2Zk1WRkRJSXhuMFV3K0FWQkNlOEtXbk0zSG0xTlBO?=
 =?utf-8?B?YnJmUHhnWE5NQ1Vob25GVjBDQkRkYUJESVZIUSt4dEtqaTNrWFNuZHNQcVhL?=
 =?utf-8?B?eVBITS9ud0xYdy9sRFpZdGZaTDIwSHpqWTJTSUlPSXZZMWc3R1ROUUg1dUkr?=
 =?utf-8?B?ZVJHTHZ3SWVkQ3BHdkJwMGtmZm8xcjhOV3dGZzhnaEQyOHpzWXlJY3VFaG5n?=
 =?utf-8?B?V1V0R0NkY1RSUUxSUHRZS05oVEFrTzhLRzc0ZGxuNmRYTUNQZGYxQXdyTU9D?=
 =?utf-8?B?djd6Y2ZBVVVSbTVMYTIxUTdPOFVhWjZoRWRQbHp3KzFZSnBrbFB6SUtZdlNS?=
 =?utf-8?B?cGE2bGFvMGpEQUt1UDAwZHVkLy81UjdoUVJRekZ4Q3BWSWtZRGVUZmJ6V3NH?=
 =?utf-8?B?cTlMWW4yaDlKRmcvV2ptU0ZjMzhXZXJ3Wi9GN0F5elBpNjBoTUtyaTByQW9D?=
 =?utf-8?B?OVNld3Vsd3pnWFZlWGFSU0NJU0xnTkVuWmFob1dHdmx1TTZpSlZPTTJHb1Zm?=
 =?utf-8?B?ejdxQzBzcTNqY2NmckhTQlhjQUpla2JDTkUzcFpZU0JhRm9veE54UEdTNDZH?=
 =?utf-8?B?bHQ5R2lleTBDR3RDeFNlRWxZcGFCYmsveDBxeDJrZ3pqd3VpZWVLVC91eUN1?=
 =?utf-8?B?L08xd3EvR25oRXJFa2pCZU56OGJGQTJOaW96V3lVeStqQ0pSczdsSndWZ011?=
 =?utf-8?B?bEx1dVFITVBVbmprODkyN2dNRE9DSS84MmdDdkxWK2xaaDNieUxGWUgvd05S?=
 =?utf-8?B?Q3BWRmt2QVo3VzZXc1U0eHNDTnBPRGxCbVVrNnlTZk92b3ZDc1pSU3oyeGg0?=
 =?utf-8?B?V3l4anhYMEU3REhvWGk5bnlUT0JYQXlsdUR2S3FqNFdHZG9ndnNDTTRuMklJ?=
 =?utf-8?B?NzVWYm4wdHpLWGtjUVRzYWxlZ3RxRzF0d2kvdjIrUTNvWFM4Y1RuMWR3djJ5?=
 =?utf-8?B?YkxGZTliMldiOVRtdE1xbndqR3BwQlFVaFg5eC9QcFJzdkdraHBYLzlZYWJh?=
 =?utf-8?B?UHRlbENmVy94Q0YxRlZGd1B1azdOQ0F2ZXVPZ2J1UXJoWlI5b1hBOXY4UmtQ?=
 =?utf-8?B?TllaeXF5bWx4dlpOREtWMUVlOXNjbjBiQjhmN1RPc1U1MW9pMUM2aUlmYk5P?=
 =?utf-8?B?YUNtT3hZRVgxVkN6RE1TZ0duakdmanVSYjd2QUdpSVJpWGpHNk5Fa2JSSjRq?=
 =?utf-8?B?NXZtZWhvcDhOSVZxYU5QaWFITWpQRjVZK2xpcjMxa0VtcUxUdVFkTmtNYmdt?=
 =?utf-8?B?dnNZZHNSdVVwQUlDVWFpOFFOaDNtSG5UNWRmYWszckZuY3ZsL2lpRWZ3aTN4?=
 =?utf-8?B?aDR2UnBIbFFNWHNNbGdoVGhORlh0ZWNBT1RUUE4ySGxYRlUrS3IrSTNvUFlB?=
 =?utf-8?B?RkNPWlFGNEViOUJIV3RzVFJZR1p2em9jc2J4azFFY0Vqazk3V0ZxSVpxTDJ5?=
 =?utf-8?B?VWx5b2hOTlg2cFQrZ3NFMkdjTVphZnY2Vm16Q01xT3lQcjFNbExQeDB0UEFB?=
 =?utf-8?B?R2IwUkpKK1BwRndKdldaK2NZQXFYWmY3T0lBT2pwNEVLZEU4R2dhUWQ0aCtp?=
 =?utf-8?B?WVphdjJXbXhDQUt2UU44NW00ZmZoZGxmbDhzYml0SFJUTGZZYm55Mk5vd2xG?=
 =?utf-8?B?VmNXVVI4dUVjWVVsTUY5UmpDNjExcEpyMGFvRElnQlAwVmx6RFl5enU3RzVG?=
 =?utf-8?B?NlRzNWJLSXVxK0JqcjkxenJLNndDV0xQZ2FKOWVKTlpnZHlUVWZIbFE4WkVW?=
 =?utf-8?B?em9zSWMwM2RLek01N0pnQVJlVWRJam1oMGwrTURPNEkzYUNGSks1QT09?=
X-Exchange-RoutingPolicyChecked: nXj4LUtPwIS2Pm4g6w9lDL5yWsGsbrgGtL5ZYtm94/Qz71mv1GJd7JX6ObJW3p/bypSzXJrXsmAUWfk3CHoRpwg279N4QLp9Q6uDuqNCyrva8yHhHcdgls9rjMhUGz9WVm26J0tv8cY9QJyzindVo8zI4AXyOBXLeT1Fbj2d97BDC0mCz5+LY4RM+aSMVBgl14x9bBlnSnH3TkpNDfFLlRx4QK+aVD266hKuNzSDFqSwfrOSXMO+97Fs8RyXx6R6Mf/ukEtufY/ZKSonR1jBKs/XByQCxZY+XiJDArpC+XY9I/Ehxyo0r1wJJlwHCFouG1YWXie2I/IMeC/6/2BtQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf39a569-b0b5-4364-52b0-08de9398e822
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 04:56:47.6095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZVwq6CUwGmTqhK3fzFBedLEuFFV8ozubuEGUz18chxgl6tNv50WDmZVPeTJ8wnLmVI+UYHZCzMdlKqlbnbYgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
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

Hi Vidya,

On 02-04-2026 19:15, Vidya Srinivas wrote:
> When gputop output is redirected to a file or pipe, such as:
>
>    gputop -n 5 -d 1 > results.txt

Isn’t only stdout (fd 1) redirected to the file here?

I guess some thing like "echo test | ./gputop" would be returning the 
default value (-1 in this case) for con_h.

>    gputop -n 3 -d 2 | grep rcs
>
> ioctl(0, TIOCGWINSZ) fails with -1 since stdin is not a terminal.
> update_console_size() then returns without setting *w and *h, leaving
> con_w and con_h at their initial value of -1.
>
> The main display loop uses 'if (lines >= con_h) break' to limit output
> to the terminal height. With con_h = -1, the condition (0 >= -1) is
> immediately true on the very first line, causing all client output to be
> silently suppressed. The result is that gputop produces only ANSI clear-
> screen escape sequences and zero actual data.
>
> This affects anyone using gputop in automation, CI pipelines, or any
> non-interactive context on Linux or Android where output is redirected
> or piped.
>
> Fix this by falling back to a default console size of 80x50 when the
> ioctl fails, consistent with the existing fallback for serial consoles
> (where ws_col and ws_row are both 0).
>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tools/gputop.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 9b2e8cb6f..112ec5ddb 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -505,8 +505,11 @@ static void update_console_size(int *w, int *h)
>   {
>   	struct winsize ws = {};
>   
> -	if (ioctl(0, TIOCGWINSZ, &ws) == -1)
> +	if (ioctl(0, TIOCGWINSZ, &ws) == -1) {
> +		*w = 80;
> +		*h = 50;
How about assigning the values during initialization in the main function ?

eg : int con_w = 80, con_h = 50;

Thanks,
Soham

>   		return;
> +	}
>   
>   	*w = ws.ws_col;
>   	*h = ws.ws_row;
