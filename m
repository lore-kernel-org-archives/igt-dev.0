Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED279C54F4D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F62110E4BA;
	Tue, 28 Jul 2026 07:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5tvdX+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAE810E4BA
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785222115; x=1816758115;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VoFL9XFI5v9M6A/R5DgRyIR8fL/j0FSAyYSzgKe8kfI=;
 b=X5tvdX+U4rbPGYgb3ZD8yWmJ5N1l+0Xi1x3M26wOPJRlOa/OdZVScTdE
 EFdZulWarMczwseV/pa2pYC1y2QlCqsR6nfm7ce1BW06PsKF4Xu+Owd9b
 pQSTcW+hIzNa41BarL7GwDmtWUXycsogAXXuuHARilwtYabHy8B1/Cm7U
 gFCLSBYo8/eUS5X3PAZuKTKyPGoQTeNPARgwQbr/e3775cCyEwHc8C7C2
 FGnpH8e2Z7aSLtM3AIoTRcUTdDnvDbjZpvyFDvO/5U2qy9Tko1JbEWPHl
 1fKePKmjQfiEYdSAqvpeqbC5iSqBsLY9G3IU8XB0KonUnrD08cDgW5EZm w==;
X-CSE-ConnectionGUID: NwJWIErOSiKMQo5o2aQnHA==
X-CSE-MsgGUID: diSP0LSBQBqQoCGBgnDzwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111344188"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="111344188"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:01:55 -0700
X-CSE-ConnectionGUID: DSv/qoI8TIOWqHG80Bwkow==
X-CSE-MsgGUID: HXWabPZ+TNGct0MHNOM6gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="256280609"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:01:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 00:01:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 00:01:54 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 00:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4d6m4E3KoWrCXrbRYL6ILJBc/1iwpBqwhArBBzQYC1+8KIGj0iV0xdVozDTQGwaEc7DcrYwpC4rKzfZVg2LQXwVEuuvoihpkSyCaBl+xdCUMXQgpoqpSzDTgnsYqArJV6qI8p1W0088qeMJJe+xzRkzHBH2Wpvnd531KSDATSfxRS9ex3wvveJGXjBa+BIyYtivyt/3FZnXS5rBErh8zHRj3eR3vqKEolp3BYbHtRN5w+ZN8iDy0LzamiGgFEKkhkU/ANlCJOlSORShffYXIYA3zZpFFRwKZyqYRVqV+vDXbkAITNy4WeDAakJq0Wo464QwH4q2s2itzyvfa/6xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+fhaU4LN6CsKaBU/xixole6dKJPnG8bhSRVMkeBdCY=;
 b=WYfC1d2jy3v/pSA4OExxhbin/69gSjqYn8lTD7hwjJN6gB//A8uvree0oEE4K007vgMK+kqB7saRrcZm9t2ZSxMFeei9vJYFBIJfGSITIUylbieipDRQm+Ts7fNbJ/QByXa04awU/CvN5QIjzjugYmGdEOqSlpeg4RFyEbhM/ix5fBEa1E7mv+JM1PvbfjMKhM7Dpr93yBv7pBAQuSsw+rfi6HE2smyLH/uZ7HvbwXZqGCyf1OBfTWqzWC9UNeXcFR97/vXZ1dOe+AVZRNuRaVx2lxJwBaHbDQSuht2KP0Xk+vef50BtW+anhCI3/RkH6OdACsU//cYSacGHB2rsog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:01:42 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 07:01:42 +0000
Date: Tue, 28 Jul 2026 07:01:34 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v4 30/31] lib/igt_core: move igt_load_igtrc to igt_rc
Message-ID: <vf2cjkfqfwwluxjkcyzkdmgpp553dfjikhok3xefypytmf7uoe@yevlwzhe3mbh>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
 <dc06fc3a7bbec6314046d0cc9f2294853beef539.1785152675.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc06fc3a7bbec6314046d0cc9f2294853beef539.1785152675.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2PR04CA0042.eurprd04.prod.outlook.com
 (2603:10a6:10:234::17) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SA0PR11MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 093a48d8-7307-428d-81ed-08deec761478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|22082099003|3023799007|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: YSf2UoKv9pJ3exX1l/DAmEyEqDe52n0x3ueCrWDhtiOHTdQx+FaId/VHqTyjJtkCi3iDnk+zhyrzYUzwnetTH8ET64Mo80E/+OWafhkIsNwYj8HqeTZfkLnCFKyMDl2PqpXw0ejsAAYrsUdarHl/wSh1MN1w9+0rJNy9edfsHAhornB1/KgXvmyY+CrBNTgkqtj/vHuTYG2wZ+rRtraQP/DCAXl4ctv8XVzU7Y/N7ca035H+Xp+j0IOqfxcmp0gj2m6KGkeFOhEKslrRIS1dAaazB0G6vVsaZtk+n9Bs3iAeGNLPAgE7eGlYVAHf0kWWYQ8g9hwNhfgDNICHBYdh65zu+8F0M8K4QS6mrDRP2iezgdrXhqCqbOLsVHJHbTzD/IToegdENHW48rE89fxQDorXylNtkdQdaleDOR6JljG8IxeFYH3+6MkVm5z7B6eU2vNdqgIUEtgpf2iiNef8kcMcn79MFyIrm5R9Ql7Qz/Y42oDJFUqHplABJFO8LHySAjzqi7tQoapa5lKUoCqSVKbp9SSMElA9iXDL3KgV1C8oP2jKXZ0eqcpj0JL3w2J9nKCWRy8EJjMsL1sFurNFGfwYCDvPc1wGyav5LpabdjFvIkDrZ9n8T0uLz2mkMheyP0tgtF0c3EBkdlh0v0ALUIXyw+XQ0LooRJKrwLHpJtk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGU3ZzBFOSs0T09zd0UwLy9FTmZoQnVsWnQycnhXRjBOcVM5b2xwYXVZMEtP?=
 =?utf-8?B?RVhuaVBJaUZlVGNrUzErSTJYNE1ndm83bzc0TVVnT2JWWC9kZVdtLy81cE1Y?=
 =?utf-8?B?TTFRZnpPNHVDdVM4b21HcVhIZjdhTkJuRU95TXBrZmt2KzZSNHhjM3hKTENC?=
 =?utf-8?B?Y3hldkpRaktCbTRQMGFuUlBuT1BESEJtN1dYYW0zREtSQXI0M1B4RW5hVTU3?=
 =?utf-8?B?RHBRdFhlSmk4S2lOSElwN0l4WEs0bWFUczkwU0FyNjNIdDN4L0Q5cUZmUUtR?=
 =?utf-8?B?TE1mTm1yeGp1dTZQYkFTRTFqUHFvSXdtMjN0MmFRMjBIRFlxTjZ4N1BaWmo4?=
 =?utf-8?B?M05oZkk5Rm5wTGlhZDI4VUlVS0FoMncyblZkTnQva3N1WHhvb3VWWWxBTGNt?=
 =?utf-8?B?ZWk0Z0pmMC9WMVJYTWIwYlRGQW9WZ29ESWMvb0gyeGVHaFV0bDRYd3ZXeTFm?=
 =?utf-8?B?QmJGZXFHQ0VBeFpFd2JEcnBkVFYyUXZrU2I1bjhPdDB6UFNOTlNZcU9sYXZU?=
 =?utf-8?B?U0N0VjlHREZmOFFIelR2WWtQV1BpNWxzYmZjYkwrejFEbEt1UlJpSlkyVzlq?=
 =?utf-8?B?SWF2aVVROEJPdkhyVEJLWTJXSWZtendRMFRPdkpNb2FjSWtWSTNQNHU2SjRl?=
 =?utf-8?B?RjJuTHE0eExVMXM1RGE2alYwa3RLUUdPR2FmNG5aNDdSTTBBb0o0TzFYaFc3?=
 =?utf-8?B?bEptOXhmVTNGNTlqM01VL29RcVA4S3Vsdk56UzJGUHN5dFAvZUJVTEJVUlJW?=
 =?utf-8?B?Vk9WY0ZxaXl5aEtrRFRzb1BCeGRZUzgxV0Z1dVBtQlY4MmhNUUpJVEVmNk1m?=
 =?utf-8?B?ZmtJVDQrRjZoT0h0Ry9TeS9uTlA1Z1JQYW5DRGNqTnJ6QUZrTHZVcFM3QU1U?=
 =?utf-8?B?REhEZUYvWnk1bG1YS2VJYXRCa3dPN0prZFV1L3Y4OVlvaS9LOHl0OVlhYk5p?=
 =?utf-8?B?eDFsTlVzUnMxYlFINmVsTlBKOUhFcGFVcUVSYTRhUHdjb29IN3A4YnY2NWVK?=
 =?utf-8?B?dTJxS0N0VTZCNjRoN3BCU1h5OGNFWUJoSEpqTFZKNmNyR3JZNndSWk1kN3ls?=
 =?utf-8?B?ZVFqdU54cDJjT1RZaitFS3RHbFc1eVY2SEN0dUprZjdyRmhaZEU4MzJLSDND?=
 =?utf-8?B?b0VyeUc0MkJVcDdOU2hjT3AvUHAxNXpVc1lTVEUxK0hKSm9GaWpjSUFCdldW?=
 =?utf-8?B?SU45ZU8yOHJKcXRWd1NnRUlBblV6amM1TDZyRENzR1Y2bkcyYnpwTUJ6TDZX?=
 =?utf-8?B?bGlKVy9XN3FYWityM1JaZVBrMXh3dmRzaUh2WUFhQy9vWXJ4U0ZnU24wemJ0?=
 =?utf-8?B?OGxpcC81NlprZHBxUWV6YXdRb2JDdDloUTcxMkdnbW1lVmF2bE1ZNk5Pc2hz?=
 =?utf-8?B?czNvU2ZOU0hsLzFHM2VmeXVZWEc2alEzSzdzUHFKY3h1ZmMyRWIrc0R4Z0g1?=
 =?utf-8?B?N1Y1RjU3VFh5eTh6cXJ0M3g4MnNsNFZ5L3g5RlI5OGwvUU9GNTY0dTYvLzc2?=
 =?utf-8?B?THFsTnVOa3ZZVVBDeVREK0hKa1I4Tm5YUHF4M2JlekpycUhyRHFiV3BVQUdl?=
 =?utf-8?B?N1d5U2E1R2JEQjdDVk83ZEhsKzE0MkdmK0tLVkZkV1kwZ1hFTUp4RlBBWC80?=
 =?utf-8?B?WmZ3UmNycGVrU2Jma0NydWtGMHI1R1lTalRnRU5DTGlyNGp2U2l1RW5FQytS?=
 =?utf-8?B?Mmx3R1NEeDU1NU9YV2R1NTdaeUdheTlKMHBwa2VyU2pJMUF0MmYxWnpob3dL?=
 =?utf-8?B?b0grMUREQmQzUCsyVndCZWhvVXRwN2x6MGhOT0x0bm1lc3BybGI2MjZ2Y3JE?=
 =?utf-8?B?MGQzU3hPK2hhSmJ6SXBwUVkrQmdUdUFUZ2NPYzRVNDR0ejg2THd3U3VFTk1t?=
 =?utf-8?B?V2JNeFRsZWtvU2tOMjZCVjl1S0N5S2E4NTU3NUpyS2VvZVlPWXpJb0kwKzkx?=
 =?utf-8?B?YW12WVl3cHBYdUFTb3dIL1F0QmdTQldhUE8zTlkvSDhJQmQ5UVV5aVo3RlY2?=
 =?utf-8?B?LytzYlc1RnJlZ1VnYnI2bUJ4cVZOQmpsdUZQQUdNTVBmZVk2c1k5NUl0Mmp5?=
 =?utf-8?B?YVdCWUg0OEpRRWY5eFhrVTAxNm9uQkQxZVh3RXdHOGdMb1ZvU3l3ZW1td050?=
 =?utf-8?B?a2VkWm4wUm1wa1gzYTFUUCs5V0tOMDRwalpwaEs1U2FBVi90RVRiRVMzdVEv?=
 =?utf-8?B?NWN4NmZhZmNORHg2U1BJY09hSmM0Z25BMk14SnFlZTdRaGhpbmdjM3owSUx4?=
 =?utf-8?B?R0UyRGM4ZTlkVE1MbjlRN2twdTZhN05FeG1VNUg4SG9MWGFKcTNUVGIvdTZF?=
 =?utf-8?B?V2FUV1BNbDAvcE5GNWRkREZUOWZWamRicHh2MlBMRGRmZEJwOTNDNUVzSDdN?=
 =?utf-8?Q?maO+5KUFoseHYNaA=3D?=
X-Exchange-RoutingPolicyChecked: BL7hWVZNnrMwVWugy8OHe94FnQkLlJ5uIabteBBO0rUn601wYW9JXrzV7sMZf8ZAW3zeHCTEK9yqzwPEndaEYtzOGceERqMEGYag1c3CCCBlFdRQrqAb0zsVsfeeHyuwV2KaFbXyA9HU9DwHMjWpcda0to2HcMukzH6/q0wK0p7+RuLTGlSBDtx1XjadsmmkWZolXZKNbQiqV+OZG9YCjj2oWy86kwzXIQ6BKVIGjpXiZY9cBY6okYi20iRjpC7LVwcAGK2QyDTVmCy//01uWpucxCL8J7rzJ5I6o4RlTHha9i7g/G8h+OmdZwtGqNxYgWlOujby2tl8j/DeAwMzgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 093a48d8-7307-428d-81ed-08deec761478
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:01:42.7699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYafh4IDlUwvQZpjjfwPgIKaS1r1DixLotnpze7tMNT/CTdkhlT+4D+PIlka0VpJtRt7xOWa5cXtOjNXRfHXNTO18D5rzW98S5PNvCwD9fI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
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

On 2026-07-27 at 15:22:58 +0200, Sebastian Brzezinka wrote:
> igt_load_igtrc() reads device configuration from the igtrc file and
> is used by igt_core, igt_chamelium(_stream), the runner and lsgpu.
> The associated global, igt_key_file, is already declared in lib/igt_rc.h,
> so move the loader implementation there too instead of igt_core.c.
Nit:
The info about usage of igtrc is unnecessary here. The only
relevant part is:
"igt_key_file global is already declared in lib/igt_rc.h,
so move the loader implementation there too instead of
igt_core.c."

I do not think this deserves another version though, could be
changed on merge. Apart from that:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/igt_core.c    | 47 -----------------------------------
>  lib/igt_core.h    |  2 --
>  lib/igt_rc.c      | 62 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_rc.h      |  2 ++
>  lib/meson.build   |  4 ++-
>  runner/executor.c |  1 +
>  6 files changed, 68 insertions(+), 50 deletions(-)
>  create mode 100644 lib/igt_rc.c
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index a7c097d9e..2f737b01a 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -972,53 +972,6 @@ static void oom_adjust_for_doom(void)
>  
>  }
>  
> -/**
> - * load_igtrc:
> - *
> - * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
> - * home directory if that is not set. The returned keyfile needs to be
> - * deallocated using g_key_file_free().
> - *
> - * Returns: Pointer to the keyfile, NULL on error.
> - */
> -GKeyFile *igt_load_igtrc(void)
> -{
> -	char *key_file_env = NULL;
> -	char *key_file_loc = NULL;
> -	GError *error = NULL;
> -	GKeyFile *file;
> -	int ret;
> -
> -	/* Determine igt config path */
> -	key_file_env = getenv("IGT_CONFIG_PATH");
> -	if (key_file_env) {
> -		key_file_loc = key_file_env;
> -	} else {
> -		key_file_loc = malloc(100);
> -		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
> -	}
> -
> -	/* Load igt config file */
> -	file = g_key_file_new();
> -	ret = g_key_file_load_from_file(file, key_file_loc,
> -					G_KEY_FILE_NONE, &error);
> -	if (!ret) {
> -		g_error_free(error);
> -		g_key_file_free(file);
> -		file = NULL;
> -
> -		goto out;
> -	}
> -
> -	g_clear_error(&error);
> -
> - out:
> -	if (!key_file_env && key_file_loc)
> -		free(key_file_loc);
> -
> -	return file;
> -}
> -
>  static void common_init_config(void)
>  {
>  	GError *error = NULL;
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 3337293bc..afaf35aa8 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -95,8 +95,6 @@ extern const char* __igt_test_description __attribute__((weak));
>  extern bool __igt_plain_output;
>  extern char *igt_frame_dump_path;
>  
> -struct _GKeyFile *igt_load_igtrc(void);
> -
>  /**
>   * IGT_TEST_DESCRIPTION:
>   * @str: description string
> diff --git a/lib/igt_rc.c b/lib/igt_rc.c
> new file mode 100644
> index 000000000..b7f1731fe
> --- /dev/null
> +++ b/lib/igt_rc.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#ifndef ANDROID
> +#include <glib.h>
> +#else
> +#include "android/glib.h"
> +#endif
> +
> +#include "igt_rc.h"
> +
> +/**
> + * igt_load_igtrc:
> + *
> + * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
> + * home directory if that is not set. The returned keyfile needs to be
> + * deallocated using g_key_file_free().
> + *
> + * Returns: Pointer to the keyfile, NULL on error.
> + */
> +GKeyFile *igt_load_igtrc(void)
> +{
> +	char *key_file_env = NULL;
> +	char *key_file_loc = NULL;
> +	GError *error = NULL;
> +	GKeyFile *file;
> +	int ret;
> +
> +	/* Determine igt config path */
> +	key_file_env = getenv("IGT_CONFIG_PATH");
> +	if (key_file_env) {
> +		key_file_loc = key_file_env;
> +	} else {
> +		key_file_loc = malloc(100);
> +		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
> +	}
> +
> +	/* Load igt config file */
> +	file = g_key_file_new();
> +	ret = g_key_file_load_from_file(file, key_file_loc,
> +					G_KEY_FILE_NONE, &error);
> +	if (!ret) {
> +		g_error_free(error);
> +		g_key_file_free(file);
> +		file = NULL;
> +
> +		goto out;
> +	}
> +
> +	g_clear_error(&error);
> +
> + out:
> +	if (!key_file_env && key_file_loc)
> +		free(key_file_loc);
> +
> +	return file;
> +}
> diff --git a/lib/igt_rc.h b/lib/igt_rc.h
> index d871b3b26..3b7179808 100644
> --- a/lib/igt_rc.h
> +++ b/lib/igt_rc.h
> @@ -33,4 +33,6 @@
>  
>  extern GKeyFile *igt_key_file;
>  
> +struct _GKeyFile *igt_load_igtrc(void);
> +
>  #endif /* IGT_RC_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index aa8eae68b..9bd484c98 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -37,6 +37,7 @@ lib_sources = [
>  	'igt_os.c',
>  	'igt_params.c',
>  	'igt_perf.c',
> +	'igt_rc.c',
>  	'igt_pipe_crc.c',
>  	'igt_power.c',
>  	'igt_primes.c',
> @@ -379,8 +380,9 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
>  	'igt_map.c',
>  	'intel_device_info.c',
>  	'intel_cmds_info.c',
> +	'igt_rc.c',
>  	],
> -	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
> +	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub, glib],
>  	include_directories : inc)
>  
>  lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
> diff --git a/runner/executor.c b/runner/executor.c
> index a8907c575..1592feee2 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -36,6 +36,7 @@
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_facts.h"
> +#include "igt_rc.h"
>  #include "igt_taints.h"
>  #include "igt_vec.h"
>  #include "executor.h"
> -- 
> 2.53.0
> 

-- 
Best Regards,
Krzysztof
