Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D2E103E300
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 02:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301AD10E33D;
	Thu, 12 Mar 2026 02:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQss6kzp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1092A10E33D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 02:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773283707; x=1804819707;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pl9oyo+VYqu8/cnDvNFA9QgMcf5Ob/K4A+VToWQpHTw=;
 b=GQss6kzpo25PRo6iaKuj8PuXoUH0Bz4WFQ/DhOH3NlmNOeHbG+6jSSOW
 ZlUpoGQMmTxRv84vR69n/2sNu8UvP1z+GSWFTg7my5gKhpG8M5h/JONnr
 OanBxJq48DoIVq7HkLllyX1thBiyatjaWgUquvAU+BLXZwUYQ2Y9NlGHF
 QmhzG03bdoR+HKvdB9JE+duKJvuopJqN104QYv3Umluo57d/W4lmUiwiX
 SQg4ZFtAlmjU8zeSB8pMu53fcni6WjdwgfcUjq8vnnljE8qGxHaT2DhWG
 EfUFiiSv/MdREhRgAegK6pyZAVcgeMKCK38oMQhizzHVcQjbHPDQzm4rU Q==;
X-CSE-ConnectionGUID: tgIms603RdanAvZvPErArA==
X-CSE-MsgGUID: 0n9S3nGETeiAOyK1EHFdVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91939287"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="91939287"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 19:48:26 -0700
X-CSE-ConnectionGUID: tLSv55CSQCWHrai8Of1+3g==
X-CSE-MsgGUID: IrGKX02xR+Sw8wd8suPmGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="219940896"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 19:48:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 19:48:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 19:48:25 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 19:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXWBHlZmJetVShN548LVfu2F3U1YNhVvNtmJnoKccVHJtN/+dXHA6Gcb+vc6sUf1mpxchsKGqbLZ0INpfp22nM80/V6xyiR1FgzFo8COeJodof0bqOOpCUXOtw5Q/aac8u7+ECqsL+Wvl3jLjluDqCV91uGTMqy9MwL/rMf360SIKRAuks+1lbP9T/WxfhNMf6zDk/zvkFHhIx4kDdex1L9U5EK0mR/ypr6cupCQcGEmlJ4JElHj9h0q8EchXnhMGV+ZSi7gxHmm4dFl3r6C5hNP9vk2ZqF1CiXKqHqKjG9pxzcWy4u9K43eOqPXtxzrEOO4Sp6d3sOcQAXSOW3OaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtuAv3yShlyeSO8Eq/r7a0ps/pjdQ4H7OC+mFnEbli8=;
 b=UIB+cS+GthUW6YoUePRSkiYkmLIBaHvRc0sUxWkuVmS0Va59cIBO/cRxV4YHrrdlx/WIyio1nWpIz1e/XYXRS7LWap+0WO4xhgJEx9oFU3Khves4yY0J5TDgeafdy56Bs8s85oFMXdB2QEo+GjOZdTxEQQJuOaHGfMPQrrl38HeOTqB32THjslC6bEUhhg/dVRYnWFtwvdLzTUoiSB4JLWjp+3rLnfZfE7LOh2PGrrK/psKKNKD6Aj6d1hwUnNnWGmsNUt41GP6wm/U9YwX2spoq4/EVBlTK/DeQIrXerVFtg35flGoo8zEG0/4FxtyeWA/S3mMISqSxhmS4ddCffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH3PPF7A88A980A.namprd11.prod.outlook.com (2603:10b6:518:1::d32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 02:48:22 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 02:48:22 +0000
Message-ID: <c6b31fb5-341f-4e92-a6aa-5226d062168f@intel.com>
Date: Thu, 12 Mar 2026 08:18:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/igt_kms: Fix joiner force debugfs entry and
 expected value
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260311105033.220652-1-ramanaidu.naladala@intel.com>
 <20260311174001.224347-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260311174001.224347-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::14) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH3PPF7A88A980A:EE_
X-MS-Office365-Filtering-Correlation-Id: f1174879-8467-421a-2dba-08de7fe1d301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: yb00JLGIwAtSHawlz61DatEl+6sWYe5WXHkp1I2odzsfMvn7HJFbYqADiLOKNMapmy9P1DagK217U4f0WfNG1ZDLJ1RvDP0stMzzMewLO1DYGYeFA3BfNqsQA1nKBkWeIQCmmSe3hmuFHiYuC3s0ZSGRVOiTP6ERk1Ogk7WcJeUnf9hSF4r1Lxb9RY580sFUuOGe25dh3fEDoEqxnkdX3ITJrxg0CD4ayUImboy4DcHDHI8xOtaOG7ksapsjFt5JDvShLqoObnEoqu8BZ7+VMTeOI8kGmobE8gfoSPnqcnSNj7WI3V8Yb6iI+jsKR9AggolzYvYHRHbXabUK07qYw732LCg0ruWZlH4xxwBoC3ZNw136a0VAt4KgkWU6A9ZEBj6Pt18+ABPYwqIFnZuM/eeUSoSSTrBa7tgRih0TjgLvMXj/cV3wZ0uJ5uORGaRVnVWsxazgzs6NqLA7deZ6lebbEZxW7mj+0/GRXabvPnaXakAj/p9bKuU3+qTtFsQQtYMfoFNUkZbwmzzhQANgHThj3+NGtdzaxYkhph9FK1Cs7VwuAU+69vkw685qxsGNlIMy78b3t5h+u9yf9dNxBlEt57iTyne5gaPTYXn43mj+3c1XVE1razfUHJ8RprfKJSn78b3le+SJjBV4/eSspZexDVfeKBnfgcd7KmeWWzIHJFqDTgUcr0+e0d1R8t3YIb0ijquImTJogscPybty+dl0laO5iX9oEt5iTeLwZxU9q8u9sGwIxmJW7ItFlAZZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFp2Vkl3dGxzT3RvZ2x6VkxZc203RW9mL1pxTjVEbHcrUXlwOHh2SXhvTWRl?=
 =?utf-8?B?NHRkdWZta0JWcVNDR3B0bmR0YklGLzQ4NnFZRHRDTmFZRFdGa2gxOExVWUtF?=
 =?utf-8?B?U1hGeW1mbjJaaWlJMFlnTzBpZDNzZm90VmErTEtNZ3V5SDVEWFBZOHFrWHhW?=
 =?utf-8?B?b3dFU3habGcyS24zV2ozSGJ4ZEoxU21icGdXanFBb3hKL0tSVVF3UUZ2NzF1?=
 =?utf-8?B?YWhwcnp2N3QxZDRzdlNYWVVTazBKcUs3TmNZdlpzSUJSc0taZlIyRFhSdnp5?=
 =?utf-8?B?OGdmMjNSQ25LRHNTZm9MZGlDbjk2cGcrTmowRGtXS1FnbHBZQ0lzQVJSeENq?=
 =?utf-8?B?TGxza2Q4S3J0bG14bFBYSzcvSnNKV0RqR1pMbDArZ3ZpL0ZyY0Fjd1JSLzNs?=
 =?utf-8?B?YTBIemFnK0MyMGN4VnRzRWIyc3U3MGlLSWFFUXBqVWNsZnMrLzExMTlvYlRV?=
 =?utf-8?B?aTJVenhyQnJLZld2YXVwTjlFM0t5dGhsblJEdG9xb0NENzRmMU9OcnFmL1d2?=
 =?utf-8?B?UHRDN2JacnBHUWVFbUNvTWg4WWhtN3BNS1kyZ1MxUWJFWG14UGhVb1k2cmQy?=
 =?utf-8?B?aVhkRlZLSzhqZ200a3hzS0NrbUl5UURDOGhkUzcrZ2E1TFA2V2xZM09iWHY0?=
 =?utf-8?B?N2M1dzRDY29VZUxDcGo2Rk9qc2FsSnVQZGdjcU8zRktPdXRGUjJnZXFoeXpT?=
 =?utf-8?B?dnpKRVlRL1lBQzI4NVlSeEE5VkN4bTBLMDVaMlNPMUMwa0NuZlhGOGhrcHNI?=
 =?utf-8?B?UzlaR1I2NzFjM3o5Rnk4VG5va1lFSllkQUYvcGNDY29HWmF5Q1AyR3FGbWRa?=
 =?utf-8?B?bDFjMm5SSHk2VllsZTNJa0lua1V1aE1vVWdNWFUrbzRzRmpOSndmRXFMMkZJ?=
 =?utf-8?B?d0JPZnNwcjA0bllQVWZrYkV2VXBxSFNmSHVqeVh1d1Y1S0IrZ1hRNVB3emxR?=
 =?utf-8?B?dTI1clVoOFJPNWlrdXRIMzVnQ1c3MVVGZjFwQ2w4WlJ6YU51ejZIendFZmlH?=
 =?utf-8?B?Q3B5RmVWUmxmN0R3NGh2bTI2enU3cGNlbzUwOTVjdzV1bmw0cHhrY000OEJG?=
 =?utf-8?B?alIrck5HaUhqaFVMU0VaaXpOSEtkaVdQcXEvdG5pQzBtV2szZ3ZqWFdtb1dy?=
 =?utf-8?B?ZzhBRE1acS9pNUwyT3ZmK0ZwelA1YjRpYnh1dGRaMEsvVmpnalA0dmw5S2hO?=
 =?utf-8?B?N0tyYzF3K1N1WXB3d1owZGtsSFFTSWhGeHpqb3lWQnI2SjVBZThFbEhoTmlH?=
 =?utf-8?B?MWlicVRVL2xDaW5BT0F3QlBpaDlPMnRzMVl2VnNCcTJtZUhjd1c0UXpsUks5?=
 =?utf-8?B?OGUvZE1idmJNYmdzWlBqdEhCQVM5RXlIeExCNjlmb2RXVjYvelg0b0ZWaEJS?=
 =?utf-8?B?K3E1TTZGRHU2QzljakdLdGVPc0JoR0ZGU3FiTVhpemM2R3FWTnlMN0x0N2E2?=
 =?utf-8?B?ZFhPSWhZUmMrMmFjNDVVS2dGb2dvdzFIRnVtd3NaMTJWTUk5WGRjSVZDN1N6?=
 =?utf-8?B?SWN3TG5UaGNMUnN1dVdaVmFCSmlxT2xqL2t2NEN0YnBNdjVDdFpRTUtaTWoz?=
 =?utf-8?B?RFh2S0x6L21TVm5RMTRyOGJrbTRJWlE3cytvRE9PNk8xTTRHVWlQY2tSVEZD?=
 =?utf-8?B?Z0dLOHdsQk9zdW5RbitwS0MrNUdKVGhQOFFDbVlPek14MURzdlgyVFZaL0hv?=
 =?utf-8?B?WDlSa0JUWFY2NzVzRE1YTVVjTWhmZTk5OStqbVVtUm9jRE51WXZKUXgzazZN?=
 =?utf-8?B?N3BpM080ZmFhN0VDNW1CSjBkTXVHQ1poZDNnYVNXSVFBd2NOaFpaQ2JrQUk3?=
 =?utf-8?B?cGJKVXdhNnhvOGNXZzRDcnZPbnhENDNtbXN1OHF6NkhWNTF1ZXpscitpZEhX?=
 =?utf-8?B?THdsWDZhdURHcVhNV2ZWVkJ2VXd1Y0c1VVVjRGcxU2xkNTBWZ2Zua3hpRzhJ?=
 =?utf-8?B?SW9raEI4aXZpdFR4cmRaRmRuTDFyaVZraFlQVFlvVE96SkIxUWxRTHdHZXls?=
 =?utf-8?B?R3lKQ3lLZVk3TFkyVzJ2Q3ZoK0ZuMEZYQkJuOVVWOGN2NVYyRGw0VDdEcHIr?=
 =?utf-8?B?eHVpYTZydmpYVE5sVGc1ODRibk1qcnBHbVZQTUZ3L0xueFpnK1dYeG42SVNt?=
 =?utf-8?B?TkZvUVUzdVF5bkFFNklzS1U4T3U5MlQ3S1NTT3VXL3cwUmJMWnd2cnpsdTQv?=
 =?utf-8?B?SXNrVmMvN0o5azR5ZVJBdldCVFVYSStXbXRXTGVqemZqcytTcjVFc2k1VWto?=
 =?utf-8?B?YU9sdnZCZjFEalFmanNCK3V0em1PQUhZblgvbk44bWFHc1AyV291aDZ3YU5t?=
 =?utf-8?B?ZVVTaEpWQ1c3L2JLSmFQQXZ1TERidkFBZjVKNGhZblduMEE2Y2N2SkVzNjZX?=
 =?utf-8?Q?a7J2uzH7HuwZAN78=3D?=
X-Exchange-RoutingPolicyChecked: DfGgy16M37jqT5/pS1tT7YdtXJ2wFkIoB6XCWxSl7EQLJO3M7ceShvmHSw2P2j/1ANPUS2EtgFtT0rGRyLnXCnVNll5myxr4fkyfKUsPgydxMy3CMaCwUxAl2G47HPs5y08L/M6VOKplxWX3K+4vPjQshjeRvjl0UDImV8ZFpfFvc3Lq9Szkppa+THXsP4JBtDh2ymqr+ytpWmoH/W3TGSCnFXrFRr0xXqZV4o2hno/HM/SZ6nZW2ZZwICGurf2CBRxGd9yGwFFsOwJQiMWNe40BbCrtZ4GqrS1zfNU9xJaGsmJVVsrrq8hf55iC2NZ2MiJkdfssbIvuBjPCMJM4BQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1174879-8467-421a-2dba-08de7fe1d301
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 02:48:22.1348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmT9DZS+eyW5C7hugEzoDJQxfx0oPWVQIwDR/VJl+KJ/p5rcOa5K/zBWGt/UtRGQGBQDEbZPq0u5i2XlqsP0WXyI83T9u+rc421/CruSsAWLAiXQT4im+MDbF4A1e4Qe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7A88A980A
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

Hi Rama,

On 11-03-2026 23:10, Naladala Ramanaidu wrote:
> Change the debugfs entry and use the number of pipes in IGT as
> introduced in KMD.
> 
> v2: Update return logic and commit message. (Ankit)
> 
> Link: https://lore.kernel.org/all/20240927083831.3913645-4-ankit.k.nautiyal@intel.com/
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   lib/igt_kms.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0b05ddd72..58dd25697 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7138,7 +7138,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
>   		return false;
>   	}
>   
> -	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
>   	close(debugfs_fd);
>   
>   	if (ret < 0) {
> @@ -7146,7 +7146,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)

igt_debug("Could not read i915_bigjoiner_force_enable for connector: 
%s\n", connector_name);
Change the igt_debug to reflect "i915_joiner_force_enable"

>   		return false;
>   	}
>   
> -	return strstr(buf, "Y");
> +	return (atoi(buf) > 1);
 >> nit replace 1 with JOINED_PIPES_NONE.
Rest LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>   }
>   
>   /**

