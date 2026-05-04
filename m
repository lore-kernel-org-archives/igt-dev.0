Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABBDCD3423
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 07:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A41110E115;
	Mon,  4 May 2026 07:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9CiwHiM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3A610E115
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 07:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777879731; x=1809415731;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WyPl6oVyammSvE9bbzhUJdi/QVsxlFVZkj9Ftp8AtjI=;
 b=T9CiwHiMcI7j9Rm/pVeOLlix3iahIYrAeHy8AFe1nNR2KmNGvUOwoJFZ
 etgtK2H1sh/V/nwzu2XSMcmdIt8gm7Er8RciBb5JVDoLyQih4sE3fk1aj
 PNXMFcHqb46vIm0/TW2gUx127DUm+CJ48+9PeItP/SF+euzZjlNNc1l6j
 S6JqiUKgUgiB90vsttlCOMmqbvQBBLp+RNgF9KFVBFDqRQ+Qscm0xv+/o
 418WzRJkNFGrtojiK7ANwkN6Bzm/OFAlMXuQYfhX8+zKSE8+o1hv+NZCv
 x8hAJduzZePKUarjZUMvu/yU2wGO+mYERNM+73UmZXQB6cqZGXHJh0Yu3 Q==;
X-CSE-ConnectionGUID: a8yCsye9SAWnyDCD0RnfJw==
X-CSE-MsgGUID: arHtjL76SKOGoHwRemPL6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78439216"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78439216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 00:28:51 -0700
X-CSE-ConnectionGUID: vIwyq2eLRAOvApKL/g1ISA==
X-CSE-MsgGUID: q6UrMJR2SGugm5x8t6O/cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="235699715"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 00:28:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 00:28:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 00:28:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 00:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbqsFjM+5fW2uRX4appw5B5Au20cuuwiRy+OLknm26WkxqgMK5/7m7nvQiSyj3mZOKLSk2QCie79hXo5poCNG2C9gackkxMOIMJvmlliCv+gcvtrSpRhihXGHiM7FeYtcrqfNcy06ldtL9SQG0Mx1B0NyEfn0j/gbI995mSVUOW76bH+gte5yHbWpsvIGtrNjvXI0i/IS3Tt+dM5cSdSJWv4DoYDpTnHg2pgrrr8LWmEPpW6aXc5A9qjqpUKtd/w0WK8bMZ9YadYtfdWfnM+BeWadiOeBFH1zMqx/RmeT5uNKb4YlJTfAKKz1QPU88HaMxAAuivEUhxXyUkZ5O/pXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKhpCo7FUUVaNSrm56yFKZDCsPkptwxQlwQpyrp3hxU=;
 b=fH0OkME0zdHHd4zNm0OMcmODGS5EvYVvmp3egXj2pNwVejkBhQOGPhZtTieHaZvPnnT2tvcw9Xwe1jojqiKqnQohfrDyRn+A2JsVB9N6dcIu+gggxQ8QPskgI6RBaho+wilr49D0EK7mp+hRpVrJniDl1NVWf/aQ6W9LRn0fTS5nnGensx+cFB/CkgVHOFCyEhRRyIl47XqYeDmjPjE5x0g5w3sD2YBNJflusBsIl4zggMfwVEmI6qAD0uXFTEq+TkbAgHHZ/7oov0n7ax3V93R6IIXXcMkIMFD+2NzVggxiDW3GTHh4fMXoVdb0iEY2OwXQ1jMlggsshQMm7oxXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 07:28:46 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 07:28:46 +0000
Message-ID: <7c8cb284-3db3-4aaf-974d-8ec6ca6c0948@intel.com>
Date: Mon, 4 May 2026 12:58:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/6] tests/kms_vrr: Add new test for DC3CO
 validation with LOBF
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <ramanaidu.naladala@intel.com>, <jani.nikula@intel.com>
References: <20260423173403.123706-1-jeevan.b@intel.com>
 <20260423173403.123706-5-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260423173403.123706-5-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::8) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: c3587e24-899e-46bb-42cd-08dea9aec6bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: aYNdSdvWyT/XyOLdrqDu/A3xe7KgFuJz538I2lK7JjlCW2Dv+SrTdCEIYJ3PW7MO6Ra+GTjWayC8BCrjo4m9iSMLHEj5/vfr7V7DMBUzgtU6lOhuOoH+Qc6AdWZkvAF/2yMoENxBAKN0x4adhZwPhlnfYfLHLtULJfUgGyaW2rXxaTUgT58ptMuDTMnomOWgGUNHaRUYqDYVUe9MzsbGXXAIuWtIeiYaq++4Pjp19CjL/RR0+0bdFw1/FlqpX2ZkiiHtQo7wKho1GOjuFhX6uEqP68LujkhwOKXwD8f7vZZSgGEiDYd8tsD9uV/7awa3Hnbl1mjTz1P3Vl3u8tTutmQcGulOl6IX/iLpn7adUq7snbKV7GcHzNcRqn79ru4SOK9GfNf5mRL7Aa3n/G28XQCNF3qV4DHH7TEolmWbbEebMAMDOOEp43IQbcqRzPDCt7v3MiIYJhGfPidrJULDZtNrSejX5IU/DHmn/+FuvBcCegHMs75qjmJnFotDY+c1XW9/gCPnPHw6nLnCy+7STj6fR/xkn960FtysUx0PiKovvkPaYSqXs1x26LhomBO4KVhy7/eSv6DCDpnF7U6h+8XMgPxUgouN6+ocqFuYgd6pnX49LNxy4RIDbfbqlgxKfgdpLe9oxxgrhlgQI4PAnRZudsCXyz2ffEr70M9EeTN/qbe1GrS/F+fq5ukiAMVK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1NHSU00dHR0aE5zWWFFSk9XbnVpZURDUjRqdHhjbXh4NXlTU0c1RjdsTVNE?=
 =?utf-8?B?VURQLzhPTXFhbzgvRCtJcWdBdHowOTVRamNtVTR5N3Rnczl6SjZyMkJjU2N6?=
 =?utf-8?B?Kys1L2JTZWRvR0ZDWjh3WmhhM0ZaRnFFcFlTdGlmdmxqbmhDZUdDOHZIV3JF?=
 =?utf-8?B?ZHdYZEQvTkgzRC9kR2Ntc3dldkJWZkhpdCtwV252bUFFd2twd29ESmxoN1Fq?=
 =?utf-8?B?UjJwRFdGMjZDS3psWXVPVzNhcXJOS1Q0TURLZm0zQkltUytQTmlJdEtzWHF6?=
 =?utf-8?B?TStYZzFOS3g1dm40Y0RPU29TemxjdGNPckF6Nmp2MlhhWFJIV1RINWFRLzB6?=
 =?utf-8?B?RVlSWFgrdUdOekFwa3pIM3FzV2I2MVIxcFlTaVQrZUhjbVhab1U0WVkvd1dw?=
 =?utf-8?B?cVA2UmRod0Y2UFRVZkRMa013eGF5M0x6WXpaU290YUtOZkFWRzBwZXEyZGxQ?=
 =?utf-8?B?RS9lbDBGdy9pdmRMZHVGYkZYUlYxR0FManNSWldEY2tIenY3d1A0UUt4d3lN?=
 =?utf-8?B?Ly9sRnNLN3EzN0RjaXcwdEhYOU1pODUxdXByZlNCR0lnYys0U0tXUEg1cldO?=
 =?utf-8?B?MGVGVGFwWVh0UGZWRlFFZ3VuYlIzcDhrMlQ3ZHlodkRVTEN5RkNQa0ZnNVo1?=
 =?utf-8?B?NTV6Q0dSQ000b0t3dUM1QlpDdXJObHBBd1VyUnN6VmFpeWZmSU1WZ0FaVndu?=
 =?utf-8?B?a1NRaEtXajZNVWJnVFErcG1zZmdxZ3czMUgybkc1M2ZTbkVtYWdlSWtGZGVa?=
 =?utf-8?B?R201OFRIZVFGRDZJdVJQbWp4MVY1MWYwVXg5NkltY2RCemk2R0tQbFN2aDlE?=
 =?utf-8?B?NVpDSnBnMFRianFRQjhmMk5jeWIrNkZYMEI5bXZhTlVlUXNZUkZVNjBCNWUw?=
 =?utf-8?B?K3VSc3NJOUROeFVCallQMVUyNU5ISDlJMUlnOFlZT0tQQTR4RThHOG9QU3Bm?=
 =?utf-8?B?SFlUMVByOWx4MFNWZHpXV0ZIeGYySkQ5VXBmaGJNQnEwRnRRTktWdDJhTFVw?=
 =?utf-8?B?SG9KVkRsaDBsK0ZmeVF3UVhES0JmQ1Mrd01MVUduRTFxMjdPa3FnbmQrUXVR?=
 =?utf-8?B?OThjMER3Sm5wU0NmTDhmc1g2NldoZVR3eHZxT3g2MkI5V1UxTGgvL0hmRVR4?=
 =?utf-8?B?WkZSdXFkQ2RPeDNmQjg4Q0FOd3FVQlpxZlkvck9LUmxRL2xXa29aMkh1MUh3?=
 =?utf-8?B?eEJHbTd4amxkYWRuemdUc2RaSkZpK1k3WW5vOWhOa1BUcThFWGtmS3Jmc1J1?=
 =?utf-8?B?VGtXWThVNk4rZWUrN3BrTTVkUGVubjgvNzF6N0tQMGlVWllvdThaZHFsVW5l?=
 =?utf-8?B?MVdWVnNWRXFNRkwyQUF2OG1kWEswT3FOUXpJRXZ0WUN1cTQ5QzJ4VjUyVWVF?=
 =?utf-8?B?dEZMR0R2TlZuRmpkNzhVMVdrM29EODBsN0kvL2tkV0Z4YTE3YWo0SjBxdzB6?=
 =?utf-8?B?UmxrUHR3N0huUE1qTi8waGlEbVJlaTZqSW5PMFZYdTBza3ZueVRqM2s5TDBQ?=
 =?utf-8?B?RlBDTStPYkRqMlg5cFVTQUhjbGY4V0J2ZElVV0xONTVzblZRTGFmcS9mak9S?=
 =?utf-8?B?dVRKZlBvNjZhUGR1eWtRZWpRWXJieWtMZkVUMjRCbEFNNndKTy96YzVxVThM?=
 =?utf-8?B?Z25GLzRHWlh1cDZJRGJINTRDOVNtRUNQQW9lazJ4cnNNVTZiVndIM0hUdExo?=
 =?utf-8?B?NWFFRk12R0xUODVZVlZqKzBab20xT3RiRmI3b2hheWxHblZuWFFtbXpiQTBG?=
 =?utf-8?B?WjNKaHpQbkpvYmxyd3RFZUNwRjU1TDN4eDlqelc5VC9JdWZscURIU29oL3J2?=
 =?utf-8?B?eXdFeHNxUUFNN1l2ZXF2YVhuQVc2aVNNSHZPN3FENlhUUWJRQkNDNkVnNC9C?=
 =?utf-8?B?bWl4V0NPN2hEa0xMbXE5dGJtTHRTZ0htQjZROVhvakRscHpPN0c5TncwWUJK?=
 =?utf-8?B?RnNaZFVORG1wN3Q0b2RJdmthU2VmRXVlazBPd0RTbG5OVmtNblBERVVCcXJm?=
 =?utf-8?B?QnpRblZ6WDR4K2xZQTZHYzRjUFkvbVJSYWkxRkNkM3ZWQ09hMEJ4bXBHYWNj?=
 =?utf-8?B?NEZTVzdOaWRHT3hFL2RxYjh1N21UOGE1SUJuUk8vYnJqMEJuWW5sQk1mUVFY?=
 =?utf-8?B?cWNaMlBNcWFWL09US2hKVk01SzZsU1dXT0xxempEUWdZRVlHOWRZWlJkSjRT?=
 =?utf-8?B?NXViZ1lyYkJCMHR5S0pwcW5iQkdyK08vbnZZK2JVb3E0WTh6cS8vbXRZNEUy?=
 =?utf-8?B?QW1Na3BtRjA5WlZkMWJsY2wvQWVNMEE4ZVFxRDhBYzM2SVJtQ0hqRGRmR1Iz?=
 =?utf-8?B?WDFBMkw4enBiWnhobFpKeHJMbVk4ZDVoUTBjWnQ2OFNIc2JjRTFVSHVEalBV?=
 =?utf-8?Q?AXmJC8Al3qOAvepc=3D?=
X-Exchange-RoutingPolicyChecked: XeT3ilAWFaBaHpUr0K3no7tRcsiBfK0j08UehwpYrmjIUhNJyEANuTH+ycqh46QrtwCAf8JFTo1CIwetL9UHruQ4jWSkhOI3bkQs+9R1r3/hUWEF5dh1K0cfpB4E+5afkbkJ0FnCo6rrDKHuSvoo6T9dUTkPfaqeQw6gDMHo4YBjIs2U/ie5kVpjq8kEK/g4vQjaOeCcj7GPupEAKVrl3URDOIIV6LptWdxxQiHeov0LDtvJ8OekZ8mYQEQvNNx3OqPrXVWZipv78UbdKBJrmPethsJkvZ8D+5rTtlAxxgra2nIJ2d4in8dLgTRwdlDdHx0YgTbfajTbV76CkUQZXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3587e24-899e-46bb-42cd-08dea9aec6bc
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 07:28:46.1159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TB47rHoAA5muI81GkrwjDX8S519EbYs5RlYuBd9RG5xyJ6FFioPeIjJvZ/5frVwc35X1mbH090MeddDr+TQrDKsFiKLAFAZZxXIauKbNtno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
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


On 23-04-2026 11:04 pm, Jeevan B wrote:
> Add lobf-dc3co subtest to validate DC3CO entry during link-off
> between frames.
>
> v2: Fix the flow logic.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 30bda3244..b98672520 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -29,6 +29,7 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_pm.h"
>   #include "igt_psr.h"
>   #include "i915/intel_drrs.h"
>   #include "sw_sync.h"
> @@ -80,6 +81,9 @@
>    *
>    * SUBTEST: negative-basic
>    * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
> + *
> + * SUBTEST: lobf-dc3co
> + * Description: Test DC3CO entry during LOBF.
>    */
>   
>   #define NSECS_PER_SEC (1000000000ull)
> @@ -947,6 +951,25 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>   }
>   
> +static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
> +			    igt_output_t *output, uint32_t flags)
> +{
> +	unsigned long dc3co_count_before, dc3co_count_after;
> +
> +	dc3co_count_before = igt_read_dc_counter(data->debugfs_fd,
> +						 IGT_INTEL_CHECK_DC3CO);
> +
> +	test_lobf(data, crtc, output, flags);
> +
> +	dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
> +						IGT_INTEL_CHECK_DC3CO);
> +
> +	igt_assert_f(dc3co_count_after > dc3co_count_before,
> +		     "DC3CO should be entered during link-off periods. "
> +		     "Before: %lu, After: %lu\n",
> +		     dc3co_count_before, dc3co_count_after);
> +}
> +
>   static void
>   test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   	  uint32_t flags)
> @@ -1242,6 +1265,16 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   
>   			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
>   		}
> +
> +		igt_describe("Test to validate DC3CO entry during link-off between active "
> +			     "frames in non-PSR operation.");
--> Better to have message like: This test validates DC3CO entry during 
LOBF (Link-Off Between Frames) periods while VRR is active or similar.
With this changes,  LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> +		igt_subtest_with_dynamic("lobf-dc3co") {
> +			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 35);
> +
> +			igt_require_dc_counter(data.debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +
> +			run_vrr_test(&data, test_lobf_dc3co, TEST_LINK_OFF);
> +		}
>   	}
>   
>   	igt_fixture() {
