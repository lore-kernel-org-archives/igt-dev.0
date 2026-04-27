Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A85FF8861
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 09:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9DD10E64A;
	Mon, 27 Apr 2026 09:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiPv50Hy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10E10E294
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777280562; x=1808816562;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BdbalqKxHfsQy6a9oelFL/QeLhQ+8bhvVchDosZbJXo=;
 b=BiPv50Hya7rzgl4I7+bMdW+vGYI+CbRAoyUHympOLp3jRKQzwb4PAimX
 t+Fs+UUgLJnH9Zm17x3k6unyHK5UYgDDXi3WVqNlnR+L6r27cj4hw+ay+
 n+Rat/ITLrPsec3TgWKpxaisJLjTiuvdCscgPLxILMmSrw7xuiQ0rhfzN
 NJWbvtrmgH+koIIy8m7FTXRMLa7j15Giwcs2p+D7z9rsnMv5aZeg0MgbF
 Agd1+bhxoI23jKMa3sYks0JmylzZqIPHHshHd3vcp3/Hpye49sKHfezfQ
 VDHno70WM55r5s8/jnk2Et6xRkMFGZJaW/o5CqUuNDBUYIIeXogj7IIor g==;
X-CSE-ConnectionGUID: TpJgTjsMS4C4+DLrSi3gRw==
X-CSE-MsgGUID: echa/EmFRnWrBlIpiJpuRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89246890"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="89246890"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:02:41 -0700
X-CSE-ConnectionGUID: Gp3V/zZFTuS3NmvyVFgDMA==
X-CSE-MsgGUID: sdmLOklHSvaAdGjItQJrrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="229018609"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:02:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 02:02:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 02:02:40 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 02:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IX/+9ncawhOiyGgf8bBvHQZaLjv4jpiMlSiEnXEw7+uzlUajFdZBIaNishudbwzgTMpeA9uQ1WQkUszFjBY6hFCw3XadbKTpDHBKwuDbWCv/66Nh3lFOND8VN95NZK7Zs1SqLRs8sNvE/EXJ4EiZoYSInXS+7IXQaquQN+1Yx24amcPybJTbfMoYavnubw+jgwwpNV36XmpSceoNqBHIhhmLAIKI4TQqzBtsUU57fQSPdIRwanK9evvZ5wT+LEC/bdd9OUUFHkMiaTs4WdlfZE1e0mWVuHiwVW9QBkqhQs42eZgN7QzBCrIjwANwOP9c8trxpSyGf4YdDJnh+Z/QRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhlGFMC5XgHtK/6e+G0u7OZj979NExtzByyAei2b1YI=;
 b=kEX+4iT/0jwIcl0oFDN4OeNwqpIl7vlpsN/IHioQTfdYyXctMv1F5ov4pR1mWaivqzkzSA3lC4BffKvNMUClFs0zfKwIXzHm8NuQzbII4Be+f69pMeGAwRnBMe0O5Dl5I2xoKPaZ3qUX6lyOCZwaF20U9sljvY1F8L/mPDVodcdCvzPDOWagd/qTLbb3aYfXYG+PH41jDbpZZYgy3JsaqNI7CqlL1+RKnOjA1G4e/qj0UA4JmHbbPUuB9PQVbezOIkB4lRCEkQTsB1sUp6WrIX7+6JfsQBIOMo6lf/7irhb5ZTqKlIp8egWgWJ1A/mAvUO5pt+R4jAiCSJg+NEjeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Mon, 27 Apr
 2026 09:02:29 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 09:02:29 +0000
Message-ID: <5e01fc8c-4d39-41b6-b529-a06628f2bc78@intel.com>
Date: Mon, 27 Apr 2026 14:32:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, 1/1] tests/intel/xe_fault_injection: Add fault-injection
 tests for Freq Throttle Reasons
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <badal.nilawar@intel.com>, <karthik.poosa@intel.com>,
 <raag.jadav@intel.com>, <soham.purkait@intel.com>,
 <mallesh.koujalagi@intel.com>, Tauro Riana <riana.tauro@intel.com>, "Gupta
 Anshuman" <anshuman.gupta@intel.com>
References: <20260326052917.2511216-1-ravi.kishore.koppuravuri@intel.com>
 <20260326052917.2511216-2-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260326052917.2511216-2-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CO1PR11MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 019fd9fd-0edf-4b62-79e6-08dea43bb5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: O9PXlhF+X2V/ZaWu5zXyKdNN1ZxzfNNNwYxNthNSwd5VLhlopOcVSXWaZejI+kK+27CCQi8rjuY6v3AWFyCxxDDWo7WDh1p2nTuU3GZpPc2mw60XCmOz3tS3uJQpC51AvrI1MTWphOJrTyeFJ2cVlJn4bccSl420Ztp/f/1p+ZdAkI/fR3tBfZMSDayGbnfq2eoZDZ+LkaoqdA5Qx+KBp048Q3oDDLvWx6SQeZIIWz26WiK96MLL+4ZGEAa4GgLU7b24G57cj6UTIc1rzTgWhIU5J7zLQpMzN9eN7UG+Y2VDx4h7Dw/WPkSBMRHbBBEi+NXyWR3xWjjLBNp33ffrq1JCD54UO+LhyaV0DeVid6sYsU5/IK7mjyvkZhscvS0FDKEhOVNCK9Yd9Y2sGIoosdvGKwKaiCmM919bYP6dRUKiaNGNw015kqH+MzAxzS55mxFD6mnoGeSqpP/h+YcNSKMx+/llShJAEPOMF4/dJyWZ01tPygwcaCPUo5W5vvLGSkx587IgGE2pZYZBfvEKkdpWS4aNSJJTenuvEAezyYNYlWxyKPk6udpB1U9D2v9TWIvcvR4dLf43qy6flcYjXGt4Oh6aWwxi+iQ+dzwlYGCw1sbNTBxzh2BRp2psfV5IMsUhYeo/A+sfRdlyLWf/r1J9IYEUpQ2U6I/GzqEAz4W/cEJNvOWlsyrSnv/arCop
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVB6TjhqZ2F1ZVhCcXI2UE55ajlwenNlQ3JUNmdZbldNR0NIV2UzUUMvZHhl?=
 =?utf-8?B?b0NDTEtDQjBHM1k5Q1hYQ2tCSG83dHRnUjQ5elFxWXliQTNVOWxvL2pJRkh4?=
 =?utf-8?B?dnlzQncxWk9qcDNtS3A2SzNuSzFNQ1RIbGRRZ0hWRnd0WnpCcWlFNFBoeUE3?=
 =?utf-8?B?aWFqbzJ0LzcxZ1dGci9hNDc5VHdsV2l4NSszbUVmcTBHUTVaTGtXbmdCbEl6?=
 =?utf-8?B?VE55R3M2Mk1Kc2dVUXkyZ3ZiT25id0VrdVhSZm5vcTg0S0FjSFdYVWRnY1Rl?=
 =?utf-8?B?K3FvcjdpdW01QXpkQS9qNHlFVFpORDVkdWlWWWxraFAxNXZNeEljZ2ZXa0g5?=
 =?utf-8?B?R1NyRXdLUUYvTjkvMzZRTFViNGcwMFRCQjFrV2dOVkxNcFBNRVM2ZmlDY3Ra?=
 =?utf-8?B?bjhERENpV0FsL3lsR1orcjZ4VThJd0htMmhFbGxSQ1dSeTA5TDVhQUdrQWhJ?=
 =?utf-8?B?dFg1a1oxM1NxWDVTNXNna3l6SjAwZkZyR3FtK1hLaHgwL2t5Z0p3U3hYNDVm?=
 =?utf-8?B?MmZyUEFPQ3ZITUplSTl3UE5pekhyQ0NDNEI0cUFKZnErSlFXeDQrd1FBakIx?=
 =?utf-8?B?aUNMaEozeGpHS3VCMG5TTDlueW9EZzF6WUVHRVkrOUhsalpIR1E1dHlJMG1P?=
 =?utf-8?B?Nkg4RWE2ZFFWaU1JMTFXdHIwanVXaXcwYTFuTVdUdGIxUk5ScVhGVGtOaFNz?=
 =?utf-8?B?UlprbTRPQnQ5SzY5bU40UW16dTlkUkdTaWRIYXpCZ25jT1lDWVNQMEZOZXRu?=
 =?utf-8?B?L1RNN1Q4YWJmV0J0VTltZUF1ZW5TUmN6clJaWEFCNnpyaW5PbGkzelVVb0xk?=
 =?utf-8?B?T1hueUFYMlJDTU1RU1NXRmZzNkxVSnRlSFdUQ2JOaTRWSkdWTnZyeTZCWGth?=
 =?utf-8?B?ZDJoL2NwUVlXSDJ4M0VHdUVBRnM3L0xkTlNvV25ZK21hZEZHMzVqbE9WR0Vs?=
 =?utf-8?B?eGRpNytIVmVrZndmem4yZ0tFMGEycnVBeGdRVTlkN0V3bFNrRUh2dEYyYnIv?=
 =?utf-8?B?eDMrRmNHSk5VVCt0RWl5Wk1TSG1IN3ZOQ2lxU2pDeWZlQnlRTHQ4dkx3RWE1?=
 =?utf-8?B?ZkRKRTNTaTlmZXFsSHVCZ0t5VWNmdCt1dm9FaUR2ZGRndmcwbGNHbTZDM09z?=
 =?utf-8?B?SE1NYXdmamVJNk5iS05FZ2J5ai9iWm8vc2pyNWhySHpuaHJ3clFnMnBRWkZC?=
 =?utf-8?B?OWpJMHFXTE1mUS9HV0YxbzV0THlKSHBacXA0N0ZZSXorLzZmV21vaEx2NVZO?=
 =?utf-8?B?WFZNY3ZyZlV1Q3J0RHFBc1NMeDlFMnFDS0ZZeXNjMFB2MldJYitCdDFaZWZ5?=
 =?utf-8?B?MkV4VzdLMWdXVDBhdmlQbmpSYkNBaW1rS2VlWHUvZjRBckVoSitIalljR295?=
 =?utf-8?B?TFBaS0xxekFrWWR1ME9oUWxpZUZ6ZmQ4L0NYdERzUHp5blRJWjhSQXMrYTVo?=
 =?utf-8?B?a3RjR1Q1S01sencrU0JORFVhL2dYQUQ1eiswUGM3QUo2WWhqZU9TMjRaTko5?=
 =?utf-8?B?cVRPOUdrMmJDZ2d6VXdVYWJ6TnlTd25kaER3bXhZRVNqVktINjdYLzl3M1pi?=
 =?utf-8?B?cHdpTjJsLzN1UzdiUDRZbkNwbmY2ZzhPdEp6MlNldy9RQ25BMnZ0WHhweDMv?=
 =?utf-8?B?ZzhUMVVYMWRQN0x3bm95Nlg3VTQ5MmpGdXJuQnpkREpNTzd5c0xYN2o3UHBH?=
 =?utf-8?B?QTRLNklwUU9TS0Z2eUROTDhnM2puaTczeTE2R1RrVVRCa1RVVkpDT3FEeDJj?=
 =?utf-8?B?MG8xaGorVlhCOWsvM3pTK3YwVkN0Ty9yQkNLUldrKzdsY2xQUllRZDdwc1VE?=
 =?utf-8?B?TWpsYmpESjhtNTlCekVmZHVhQ2NZc2FGRjlVZ3FZMWs3Qm1NYVZqeTk5R01R?=
 =?utf-8?B?WU02YmpKWWVobGd1ZjRHeHA3ZU9iWXJuK3dubFFsVllFcWljUVBiTjZTckRt?=
 =?utf-8?B?YndBUmlNbFBNTzcydjdsV2Y5am1VUEFQb2QxV1hOVWhtd015bDlvVkFHQlJj?=
 =?utf-8?B?a25yTXJCR0Q5Z09KcHhkN204aHEybFhiUm9ESlNtbU53VU5weVI4SG9Gd2FO?=
 =?utf-8?B?OG4ranhXajRMOTJvY045d1ZtQ21pY3hrbGVXMk1rY3pyYk14NTNGZUh1TmN1?=
 =?utf-8?B?aDJLaGZUcmFPMnFQYnpIVFJNYzR0akd0YUl0a0psOUFlcm41U0k5cEQzZXFv?=
 =?utf-8?B?MVYxbWtnWTBlREZVOWs3UUk1bThNakthSlZkUGhWOTRENlVPQTZnNXFUWm5J?=
 =?utf-8?B?dUVKakZMMkZOWHNWNncxcXFTcXNieDcxV05UL3RWVGhCR3NQNlMvcVU5bFg4?=
 =?utf-8?B?MlRlWmU5R3JFYUVnSTFYQzFJWHVrOFI2K3NpQmRTN1lwZHZhalNzQT09?=
X-Exchange-RoutingPolicyChecked: b50EB7UbAnDs5w450XZYpWAyEWzq5CealMKIonKC6bV9AEXHO4ewYlJje2lk+igOuGYfmNZcPaivCn7+WJOxZgQfbGuknGUQjvJpk3qeaCTf+uPHC3PhcJEd30sGX+fK5hYVjdAIVM7ITAl4/4qD7F2MG+lDk2eW87uSfymdmZih/SeCGmPXntTF34M8yoozUhjUiUMm78/VENFQgucpnZ+VksnBKpb5bhb004EIRQP7bKFfPTm5MhctU4rXLMuMG9nKsxPRta1P3Tgno6Gz1vRF6/DMhIHMcg8AVOeBfmGjd4jyYPKUDuyh1eRvXIKSAi/i3EKd/nB7dBDd39w4Vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 019fd9fd-0edf-4b62-79e6-08dea43bb5a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 09:02:29.4670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKPiN++kwSpHQHhBPhZmq7/JU38wDYtvLtYP4J92npymYH7kdh4KvOeG2yQvz3dchq86MLENc1vvDZPuOf5RlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
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

Hi Ravi,

On 26-03-2026 10:59 am, Ravi Kishore Koppuravuri wrote:
> Add IGT test to verify frequency throttling reason reporting with
> the help of kernel's fault-injection framework. This test validates the
> robustness of the throttle reason detection under various failure
> scenarios by injecting faults into xe_gt_throttle_get_limit_reasons()
> function. This test covers all the supported throttling reason types.
>
> Dependencies:
> 	- Requires xe patch https://patchwork.freedesktop.org/patch/711954/
> 	- Kernel fault injection support (CONFIG_FAIL_FUNCTION=y)
>
> Cc: Sk Anirban <sk.anirban@intel.com>
> Cc: Tauro Riana <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
>
> ---
> Test Execution:
>
> $ ./build/tests/xe_fault_injection --run-subtest 'throttle*'
> IGT-Version: 2.3-g06706ff21 (x86_64) (Linux: 7.0.0-rc2-throttle-reason-injection-test x86_64)
> Using IGT_SRANDOM=1773144939 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: throttle-reason-fail-soc_thermal
> Injecting error (-1) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : thermal
> Subtest throttle-reason-fail-soc_thermal: SUCCESS (0.022s)
> Starting subtest: throttle-reason-fail-mem_thermal
> Injecting error (-2) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-mem_thermal: SUCCESS (0.023s)
> Starting subtest: throttle-reason-fail-vr_thermal
> Injecting error (-3) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-vr_thermal: SUCCESS (0.031s)
> Starting subtest: throttle-reason-fail-iccmax
> Injecting error (-4) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-iccmax: SUCCESS (0.034s)
> Starting subtest: throttle-reason-fail-ratl
> Injecting error (-5) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : ratl
> Subtest throttle-reason-fail-ratl: SUCCESS (0.042s)
> Starting subtest: throttle-reason-fail-soc_avg_thermal
> Injecting error (-6) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : vr_thermalert
> Subtest throttle-reason-fail-soc_avg_thermal: SUCCESS (0.042s)
> Starting subtest: throttle-reason-fail-fastvmode
> Injecting error (-7) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : vr_tdc
> Subtest throttle-reason-fail-fastvmode: SUCCESS (0.030s)
> Starting subtest: throttle-reason-fail-pl4_limit
> Injecting error (-8) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : pl4
> Subtest throttle-reason-fail-pl4_limit: SUCCESS (0.030s)
> Starting subtest: throttle-reason-fail-max_vid
> Injecting error (-9) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-max_vid: SUCCESS (0.018s)
> Starting subtest: throttle-reason-fail-pkg_pl1
> Injecting error (-10) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : pl1
> Subtest throttle-reason-fail-pkg_pl1: SUCCESS (0.033s)
> Starting subtest: throttle-reason-fail-pkg_pl2
> Injecting error (-11) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : pl2
> Subtest throttle-reason-fail-pkg_pl2: SUCCESS (0.031s)
> Starting subtest: throttle-reason-fail-psys_pl1
> Injecting error (-12) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-psys_pl1: SUCCESS (0.022s)
> Starting subtest: throttle-reason-fail-psys_pl2
> Injecting error (-13) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-psys_pl2: SUCCESS (0.035s)
> Starting subtest: throttle-reason-fail-p0_freq
> Injecting error (-14) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-p0_freq: SUCCESS (0.030s)
> Starting subtest: throttle-reason-fail-psys_crit
> Injecting error (-15) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-psys_crit: SUCCESS (0.034s)
> ---
> ---
> ---
>   tests/intel/xe_fault_injection.c | 172 +++++++++++++++++++++++++++++++
>   1 file changed, 172 insertions(+)
>
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 4f4a7922c..05f5125cf 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -234,6 +234,66 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
>   	}
>   }
>   
> +static char *prepare_reasons_path(int fd)
> +{
> +	char sysfs_path[PATH_MAX];
> +	char device_link[PATH_MAX];
> +	char pcie_path[PATH_MAX];
> +	char reasons_path[PATH_MAX];
> +	int ret;
> +
> +	igt_assert(igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)));
> +
> +	ret = snprintf(device_link, sizeof(device_link), "%s/device", sysfs_path);
> +	igt_assert(ret > 0 && ret < sizeof(device_link));
> +	igt_assert(realpath(device_link, pcie_path));
> +
> +	ret = snprintf(reasons_path, sizeof(reasons_path),
> +		       "%s/tile0/gt0/freq0/throttle/reasons", pcie_path);
> +	igt_assert(ret > 0 && ret < sizeof(reasons_path));
> +
> +	return strdup(reasons_path);
> +}
> +
> +static char *read_throttle_reasons_from_sysfs(int fd)
> +{
> +	char *reasons_path = NULL;
> +	char *reasons = NULL;
> +	int ret = -1;
> +	int reason_fd = -1;
> +
> +	reasons_path = prepare_reasons_path(fd);
> +	if (!reasons_path)
> +		return NULL;
> +
> +	reason_fd = open(reasons_path, O_RDONLY);
> +	if (reason_fd < 0) {
> +		free(reasons_path);
> +		return NULL;
> +	}
> +
> +	free(reasons_path);
> +	reasons = calloc(1, 256);
> +	if (!reasons)
> +		goto err;
> +
> +	ret = read(reason_fd, reasons, 255);
> +	if (ret < 0)
> +		goto err;
> +
> +	reasons[ret] = '\0';
> +
> +	close(reason_fd);
> +	return reasons;
> +
> +err:
> +	if (reason_fd >= 0)
> +		close(reason_fd);
> +	if (reasons)
> +		free(reasons);
> +	return NULL;
> +}
> +
Currently, there is no real failure case covered by this test. Even if
the driver reports an incorrect throttle reason compared to the value
read from the register, the test still passes because we are not
asserting the expected reason obtained from sysfs. The only possible
failure scenario today is when IGT fails to read from sysfs, which is
already validated by the throttle-basic-api test.

Therefore, it would be better to compare the expected throttle reason on
a platform-specific basis in this test.


Additionally, it would be preferable to merge all the subtests into a
single test, similar to the approach used in throttle-basic-api. Having
one subtest per bit adds unnecessary overhead to the CI test list.


Thanks,

Anirban
>   /**
>    * SUBTEST: inject-fault-probe-function-%s
>    * Description: inject an error in the injectable function %arg[1] then
> @@ -529,6 +589,90 @@ oa_add_config_fail(int fd, int sysfs, int devid,
>   	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
>   }
>   
> +enum cri_throttle_reason {
> +	THROTTLE_REASON_SOC_THERMAL = -1,
> +	THROTTLE_REASON_MEM_THERMAL = -2,
> +	THROTTLE_REASON_VR_THERMAL = -3,
> +	THROTTLE_REASON_ICCMAX = -4,
> +	THROTTLE_REASON_RATL = -5,
> +	THROTTLE_REASON_SOC_AVG_THERMAL = -6,
> +	THROTTLE_REASON_FASTVMODE = -7,
> +	THROTTLE_REASON_PL4_LIMIT = -8,
> +	THROTTLE_REASON_MAX_VID = -9,
> +	THROTTLE_REASON_PKG_PL1 = -10,
> +	THROTTLE_REASON_PKG_PL2 = -11,
> +	THROTTLE_REASON_PSYS_PL1 = -12,
> +	THROTTLE_REASON_PSYS_PL2 = -13,
> +	THROTTLE_REASON_P0_FREQ = -14,
> +	THROTTLE_REASON_PSYS_CRIT = -15,
> +};
> +
> +static int
> +inject_fault_throttle_reason(int fd, const char pci_slot[], const char function_name[],
> +			     enum cri_throttle_reason reason)
> +{
> +	int err = 0;
> +	char *throttle_reasons;
> +
> +	igt_info("Injecting error (%d) in function \"%s\"\n",
> +		 reason, function_name);
> +
> +	ignore_dmesg_errors_from_dut(pci_slot);
> +	igt_audio_driver_unload(NULL);
> +
> +	injection_list_add(function_name);
> +	set_retval(function_name, reason);
> +
> +	throttle_reasons = read_throttle_reasons_from_sysfs(fd);
> +	if (throttle_reasons) {
> +		igt_info("Reason for Throttling is : %s", throttle_reasons);
> +		free(throttle_reasons);
> +	} else {
> +		igt_warn("Failed to read throttle reasons from sysfs\n");
> +		err = -errno;
> +	}
> +
> +	injection_list_remove(function_name);
> +	ignore_fail_dump_in_dmesg(function_name, false);
> +
> +	return err;
> +}
> +
> +/**
> + * SUBTEST: throttle-reason-fail-%s
> + * Description: inject a throttle reason in the injectable function %arg[1] then
> + * read the reasons from sysfs
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @soc_thermal:     Frequency is clipped because of SOC hotspot temperature
> + * @mem_thermal:     Frequency is clipped because of memory hotspot temperature
> + * @vr_thermal:      Frequency is clipped because of VR hotspot temperature
> + * @iccmax:          Frequency is clipped because of ICCMAX limit
> + * @ratl:       Frequency is clipped because of RATL thermal algorithm
> + * @soc_avg_thermal: Frequency is clipped because of SOC average thermal limit
> + * @fastvmode:       Frequency is clipped because of Fast VMode limit
> + * @pl4_limit:       Frequency is clipped because of PL4 limit
> + * @max_vid:       Frequency is clipped because of MAX VID limit
> + * @pkg_pl1:       Frequency is clipped because of PKG PL1 limit
> + * @pkg_pl2:       Frequency is clipped because of PKG PL2 limit
> + * @psys_pl1:       Frequency is clipped because of PSYS PL1 limit
> + * @psys_pl2:       Frequency is clipped because of PSYS PL2 limit
> + * @p0_freq:       Frequency is clipped because of P0 frequency limit
> + * @psys_crit:       Frequency is clipped because of PSYS critical limit
> + */
> +static void throttle_reason_fail(int fd, const char pci_slot[], const char function_name[],
> +				 struct fault_injection_params *fault_params,
> +				 enum cri_throttle_reason reason)
> +{
> +	int retval = 0;
> +
> +	igt_assert(fault_params);
> +	setup_injection_fault(fault_params);
> +	retval = inject_fault_throttle_reason(fd, pci_slot, function_name, reason);
> +	igt_assert_eq(retval, 0);
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *data)
>   {
>   	int in_param;
> @@ -625,6 +769,26 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   		{ }
>   	};
>   
> +	const struct section throttle_reason_fail_functions[] = {
> +		{ "soc_thermal", THROTTLE_REASON_SOC_THERMAL },
> +		{ "mem_thermal", THROTTLE_REASON_MEM_THERMAL },
> +		{ "vr_thermal", THROTTLE_REASON_VR_THERMAL },
> +		{ "iccmax", THROTTLE_REASON_ICCMAX },
> +		{ "ratl", THROTTLE_REASON_RATL },
> +		{ "soc_avg_thermal", THROTTLE_REASON_SOC_AVG_THERMAL },
> +		{ "fastvmode", THROTTLE_REASON_FASTVMODE },
> +		{ "pl4_limit", THROTTLE_REASON_PL4_LIMIT },
> +		{ "max_vid", THROTTLE_REASON_MAX_VID },
> +		{ "pkg_pl1", THROTTLE_REASON_PKG_PL1 },
> +		{ "pkg_pl2", THROTTLE_REASON_PKG_PL2 },
> +		{ "psys_pl1", THROTTLE_REASON_PSYS_PL1 },
> +		{ "psys_pl2", THROTTLE_REASON_PSYS_PL2 },
> +		{ "p0_freq", THROTTLE_REASON_P0_FREQ },
> +		{ "psys_crit", THROTTLE_REASON_PSYS_CRIT },
> +		{ }
> +	};
> +	const char *throttle_reason_function_name = "xe_gt_throttle_inject_errno";
> +
>   	igt_fixture() {
>   		igt_require(fail_function_injection_enabled());
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -640,6 +804,14 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   		igt_subtest_f("vm-create-fail-%s", s->name)
>   			vm_create_fail(fd, pci_slot, s->name, s->flags);
>   
> +	for (const struct section *s = throttle_reason_fail_functions; s->name; s++)
> +		igt_subtest_f("throttle-reason-fail-%s", s->name) {
> +			memcpy(&fault_params, &default_fault_params,
> +			       sizeof(struct fault_injection_params));
> +			throttle_reason_fail(fd, pci_slot, throttle_reason_function_name,
> +					     &fault_params, s->flags);
> +		}
> +
>   	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
>   		igt_subtest_f("vm-bind-fail-%s", s->name)
>   			vm_bind_fail(fd, pci_slot, s->name);
