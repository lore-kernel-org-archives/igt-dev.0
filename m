Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA811C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 06:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DA910E532;
	Tue, 28 Jul 2026 06:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lX3vNlWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F90C10E532
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 06:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785221552; x=1816757552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Xqhv6GP/R46rGtH918z26mD+36a1E8/i1HY7WwlEEE=;
 b=lX3vNlWjHvOWqKuuryWV+dQlz+2PJMkfv2gPKxroM+lHhWhAaOw9fmVN
 pjVg0XHjUEsdmZO396j4QUxzSxiLxBDQ6/Gy5/EsTtvplSV/0i7XfLPWy
 Ji5+aUPlB4cjgUo+Q+rAPi7ixq/6WmQ/JNJkyz1knGur+kpSbNJ4eANrH
 XDtdLEfPtFSv+3pGpyeBlC2N6/11ZuKBb1c0v7YJR2j4/ShB/ga1OBuWo
 Q/RgEfsWDLoKTALdJonrTzS+cv5mzRckUGk2C1UzTpYC5Xui8QzfVBQRB
 XavCVQq5htjyv6MPmhOrs+67wJzN8eUcyKNV0PMH+W2F8OxXh3kODPGVP w==;
X-CSE-ConnectionGUID: Rv6bmaugSyyPX+yIz6SErw==
X-CSE-MsgGUID: bSDZ6w3oRDO6fx6Z9V0Wbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85667087"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85667087"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:52:32 -0700
X-CSE-ConnectionGUID: yqE4dQ+BSYmEDFDJ6dokuA==
X-CSE-MsgGUID: PHbTnJ+oSdGQHg0MaeiHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="255314978"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:52:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:52:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 23:52:31 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUJlM53MkYbsgzDcAzzx0uFyl9zl4WTqI4j82tncXswoDQTxzCml55hVg8WcrBxk/2oO6vX/v00s/JRI5vUL1Jfue2IXSkPZj9N9xDuOrDUxyKeafQSU8sELSMo+oGTIT3CMVUIRSq3pt222o9jr4gqqZu9OhL08KqmR/HhntDB6Wvbg84JEK3mq1dt9ylI40SV9bj1DZTcgnhW/h/JbK7BKvcjop1L5CP8ReES3OiyZbtW2H0hfJQ+THm7vF+51490SH59+0uqjp7dRL8HgvixldSxUZCy/VI2nn6ebwveTWDZKoECsAcO+NUPYeJJ2G0b+oShaOLyg9sGB7/8qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOZ6KGx3+2e4YdXR5IOy2KcGI03BsWT5xfzXSl0e5vg=;
 b=x0iK7U3RaZmClo7n4kTg5YblovhJEXfnAFSnkgf5OnSOc1HD3OPq4wrwB2wuaLqLciIyud4bJYHfqYybroH69FgFDtDE9xBICmKouIqYZf9ONuO/WOS9+SKIruNvNMaeHlpslPUMxEk3+r1jQ5q1lFlAaUW0SRq6RazsfARUIGjYL9+0A1bG5+Qtvcr7qnKqXUGLor9aHzIEdC3x/gJQFcZIRrKyLkovdewgChYMjK0e3ve655wnOSu386ezdC2PgZBJ8lynOlVWh/HgHLfiQlYQtbP6NBjqW573R9RjVL4Nfk8UgtyHA76DUTv0yeb7rkcgR4eO89iHZ8CDlh7zpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:52:19 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:52:19 +0000
Date: Tue, 28 Jul 2026 06:52:11 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v4 03/31] tools/igt_stats: link with minimal
 sub-libraries
Message-ID: <tiitluv3wahs735afi2s332gjclf5uko7lihblkcotelc2wrlj@ldkkuapm2cfl>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
 <c1d27ec2e7e1a346abd47f8d0069aa896e9fcc1c.1785152675.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c1d27ec2e7e1a346abd47f8d0069aa896e9fcc1c.1785152675.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2PR04CA0198.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::23) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 358c8844-8b31-4195-237c-08deec74c4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: jRQFEbEXw3YEm37SviJBt0zVRGFzrfzyS1BXnZi2OANuG9fZdLyh6uKB/CFCykhematQKBR29yM511sMI2lYqFc2broKKNbwsDm0xxNZXUOHJhUGOd0xJdakS7QCb11vPFfQDCps6vbnOllfE/aXnBKid2p4O5oi0OLtKbi3yrodf3D7oqHemWAoihXk/br3KJFBYAs+9pnfd0tUKqggGsykF3GTsa9oNfp+oERLYa5lbwxE14x3rEnyRZvl3N56LCGHbZb/TjQZwMhn1OKuu2xTWfEQbNtBWT0FKOeNkLVKWZ+FTO9K3+TgRUdl1cINhVlwyEcRVfTOmsUilqa6WrLfsF4Df6ucBAAWa+D28AQR4/lPXAmGl7vNV+kjNfAp79aSWiilifmXukwnKPkjyWJGWf3Ucg3LSPi+ULqKUDR3l8c+6Ia2UXdotPtMzA0nwTI6aFcFA67EVZBcgmrEycoP/Rydv7EBXFegTRK4k0IceK7Lea058X2mQM73VvtMJYrbDwAZE8igCXHoQ85Wik/hS5K9w8ebdgW7dq/gsf7QToozKXkJ94ZT/UiYoJnv6SJtMSp9oFrO3+36pyJ4JLMbj7T/2whHamz+Si5siGd/y6BLHa22s1d+7gGBvRdnajznuGpw5n+SbGDm+gmb95k12WkhnSVanW20gEd5tgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3RkQklwTkNiMUVydVJzd1lUVytKVHMwZU8xcnBURWhXbTJ4Q25pamlIRnMv?=
 =?utf-8?B?TlJOTWdSbzI5c3pyNytjUWk5S2puajJGOHM0VVpnV2FMejN4WGRReDUwTndo?=
 =?utf-8?B?eUNYcmpzUVIzOWJobnN3djEweGJzMUdVVjhKam5lTnd4NCtwcnFFSU9qdzZZ?=
 =?utf-8?B?L1JzcERwNmhzR2V5cnV0aHBQbGdhSUg5VGJBN2JFWFBrOWQyZkpSZzhEOWgz?=
 =?utf-8?B?dEw2ZnNnM0pHZ2dBL2ljTXk1OTlOS0RWM3VHVWxYRVp4TG9Uam5IbU16bG5R?=
 =?utf-8?B?dDlnSllQdUpaZnk3Vzg4ajZncWtzYXgydVQzRzI5cDVqS3dUMytET1QyV2Z3?=
 =?utf-8?B?cDZ1bW9JWUNGSCs4U2dtVTNtQWVsU1Jjdi9UWXVkN2RObkhvOWVDKzg2WHZL?=
 =?utf-8?B?UVZrUjBsMm03RDNLbEgzdklFVWpSdXVUNk5rUU9lUVRCOUZhMFFzRmVQSHNI?=
 =?utf-8?B?WUdNTEtENVNmTmZPUUZJdGhKRWM0RFBjbXBIV3VGSFBLcEp6YnpKb3VvMC9k?=
 =?utf-8?B?SlZpb3I4MDdPWkFMNnR3dGtLRXZMWHU4QjluUlNhMDg2WmdTVU9zSkxrVmNO?=
 =?utf-8?B?TlVYTEs4cEh5dGNhS3hWLzVBdUV4by9BZ3BjRmFib2dEdm1hamVVVkRWUS9J?=
 =?utf-8?B?bXc2cXVHK29PS1U4MXJJUC85dVZOS0VGeU9KRERadXRwalRzaytGb3RlREF1?=
 =?utf-8?B?NkxzOU1yejlNNkZYM3h6LytRd0RtU21MY1FoTE1WTk5ZS2JRd1VuNVgyWUd5?=
 =?utf-8?B?NXlrRWJNUk5ZajFad1FqVXlBbzRHTEdFMk1IZkRVOFN4N1RkRXJrcHVrTHRO?=
 =?utf-8?B?cFNLQWZYdmErSkdaaHJEVkhSRC9BS3pscVVoUTMxeGJ4QnJ0ZHIrbWFDeHFK?=
 =?utf-8?B?UFc0SjFRay81VUhzRXJ2UHpMczI0WHN2MGNGYXZhRXhyMEozS29kRVBDMHBP?=
 =?utf-8?B?YUdlU3JYWExMSTR1UEVWdW0xR0dlUDA1OHAvM1lDdnNVRE8xdi9NcTcyR1Vw?=
 =?utf-8?B?TTdOWWdRM2p1QUZYanF1MnlpUFRoaURHMlZ6a3pxelhZelRyQkQ4RGF1WUhv?=
 =?utf-8?B?OXh1ZU5LeVZJQURaeUlJc1FxZkN6NStjS2YzY0FpL1Q0bDRzaGNybWRJWFpS?=
 =?utf-8?B?Z3d2TzIwOCtnZlpsT1RneDBHd2JFUy84ZFNSS091RWFmbW9zNGdZU1JzRUlH?=
 =?utf-8?B?TkRqOUtnMkZLTWRKbjgxL1RJalVKSWtsVzBYNHoxd0o3TFo2TXNZT0lRV29E?=
 =?utf-8?B?YUhDb1h3MWtFbkJOWjkyVFl4aUwzQWx2VmR0WnJubnVRU0Z6UFVBS1BSS0Vz?=
 =?utf-8?B?NWJpeFRGMHR0TDJranhidWY4dm1vNWM2ODFqNmFPQ1VFc1hrWHhPdWtWWWVE?=
 =?utf-8?B?N1NEVXYwblp3ekVzRWdVY0xKaEtIaFNLYUwxd2c2SGJvYzBYVXRpM2xXZUxV?=
 =?utf-8?B?dGt2akREQkFLZFQyNWlVMEF4VlZPcndiQVppc0Z1Wm5icTlnbjR2QkFycVlr?=
 =?utf-8?B?QmZKbkxWbUJrOVhMU0xtbW9VYm9ocW5McnVsc2ZIMlhZUk9XbUtjOWMzaGpI?=
 =?utf-8?B?dVJvUVAzS0JnTlMyZ0x1b2tIcDBzZTdLTzF4RVlPVXF4dHEzRmRQY2M4cVV5?=
 =?utf-8?B?Uy91ZWJYWW5zOUtlZFh6MnVVL3I4MFo3U1cxaHdqeURZNDZzWjlVbUdGeXdS?=
 =?utf-8?B?azdsejRaNDl6dURLZU85Rkk3NGkvS3NhK21kWDFaZGg3WXZjQkI3NjFHYTVx?=
 =?utf-8?B?bVJUeGxiRTBqeEdjNTFLMHdnNHhBeXBWeGRjWFFEL2hSNWNNSnBoM09LNlpo?=
 =?utf-8?B?cE9XbXB4Y0lsZzRlRlpHWXI2MkZDa24rSWxFWlM2TGRwaWF1STROd1Q3cXJJ?=
 =?utf-8?B?RVFJTnVGUzB0Mll0U2hWVjFFR0taK1VHS2Q4ZGUySWdjeU9FR0JGVm9xb2JW?=
 =?utf-8?B?amRuOHg5aHJUd3pFcVVER1FoR1dMY2pEZEUvbGZyMVEycm9zU3NPNUJMWkJI?=
 =?utf-8?B?a0x6c05QK0tRK0l1dTV6S0o2cWZpbjZIOWtoNW5pT1c1TXlQQnFDYStsbjhX?=
 =?utf-8?B?SVRoNVVYa2szOXlwOW9rcm41VTA2VTREd0NjOXJyZXA3cHlGVXV4WURMa3kw?=
 =?utf-8?B?ZHd5UmpMUXB5UHM1YnNaWGlYWWFTLzBPU3I0OU5UbVY5ZU1CS1MzZWF2UUw0?=
 =?utf-8?B?U3IxUkpCa241eXh1ajI1ZG1pUCtPZ2s0RnB3SEpRWE5PQjd2M3Q1Mjc3aHZW?=
 =?utf-8?B?clNuSTF3Q29SVldGQXQxMXJlaGFHU3BPV0pYTWNYVURmMUpsMzZreDFzYm9x?=
 =?utf-8?B?UktrdGcyUkpyTHB2SnhsQWQyODBlWnZ1RnVJWW5uVXAyaGhTUkV0VWZUYmMv?=
 =?utf-8?Q?s7kCPM9xvDnWMoGY=3D?=
X-Exchange-RoutingPolicyChecked: r60Elob/RYLnVyAGZKYAFxnKPc3BskNNxryYoXLkhLiiDyYoofkTkL36LpRO4YDDr3nMX0jtO0eM84nFyqv2blFpSj/ZlNXbwFADUgDh+637TT2Q8uAJCPngK0mlpXEx2QlfqtRjWusD4+3DP1VP6DFZ1Nl3q12jNHp0fFSpPFOtkrk9I/vwxsAij7HpLF5u5DX/5SJf+n/cz2szD2EBiZNTGAM6ddJ5t9Ci4acUB8eNVhekbrjyDqEt6RyPoVYP+yzUAgZn92jN/6+wVNqyjsgxh9ggArtYKjcHPv0RI5u9dXXHtI5CvxA37SJL80O52q273s6lKrT+BZ+G5VtjKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 358c8844-8b31-4195-237c-08deec74c4e5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:52:19.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnkxT5VUT1s0YqTLm3+m3TaqZgjbd4aEMpdkCIJHSxkQZcE04eywQ0e0Y+7fKn1f6wcYQ6FDKxoEwLoNWp6CmGDa+8bX/NgU0n685txHH7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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

Hi,

On 2026-07-27 at 15:22:31 +0200, Sebastian Brzezinka wrote:
> igt_stats only needs the statistics helpers and a small assert stub.
> Link it against lib_igt_stats and lib_igt_tools_stub instead of the
> full libigt.so stack.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..286a718c8 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -14,7 +14,6 @@ endforeach
>  tools_progs = [
>  	'igt_facts',
>  	'igt_power',
> -	'igt_stats',
>  	'intel_audio_dump',
>  	'intel_backlight',
>  	'intel_bios_dumper',
> @@ -58,6 +57,11 @@ foreach prog : tools_progs
>  		   install : true)
>  endforeach
>  
> +executable('igt_stats', 'igt_stats.c',
> +	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
