Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C344C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 21:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BBF10E034;
	Wed, 19 Aug 2026 21:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kU34jE8/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CD310E3A8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 21:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787175408; x=1818711408;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TWWJ6YkHXLp9ivm14B43d6IECTfV3B1pYU/yNnkrNRs=;
 b=kU34jE8/k8Fkip0/XR83MZ7TSMCgl57qdxDtmK9qNl2ncXLR/H9T0Tgr
 6KklrpFGoqwy9zFaU2vqPmZZJmXXTbLIf2SujnNoE/227e2k2XMMJLalO
 818193aMXrOafR8ypJDc9ZGTW6OP5wMYXpQfnYknMR8r3PQMUbE4w0aTu
 L57EFeMMfqx7ViNCOB7GqoPDYggOFgvBAIrk9s26UCGqJDbirzZlA5Nut
 llljOjYpZKRKWlSvKBVAdn+Koso8fEqe3ODhGl97HtbvBBsdSWfkdLImS
 jf5iQnuoSY3NbbMDZoyy1IaI75CEe3HG3hU04xYKslBE5jQDgH415UzZX g==;
X-CSE-ConnectionGUID: cj+QY2FVTOOTmQpWuuIckQ==
X-CSE-MsgGUID: UmjfvJmVQ22TNs8WR41bJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113244743"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="113244743"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 14:36:47 -0700
X-CSE-ConnectionGUID: KtQrLJ7cRpK/+x6gyX7kpw==
X-CSE-MsgGUID: GNn5ygz0Qhq7VoRjoCK+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="263034194"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 14:36:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 14:36:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 14:36:46 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 14:36:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJ07v5UL/fD191m9OmEkglLflI3AiSYRLvDhdFgqGOIEPHkZ2mrBAaSR/tP19xK6NFx+0TpWM6i1hjqAfdEzY6zYxiRnyPOCnNyJTypqVu+XDDF1PsU0lvWocIr3/RWiZM+rhhceu2bbTd/nkuqWESCesBx7F1qc8RgoFYdWWHvG08a19r4zw0ijlMZJg0DzW8D7wrqzuOPxJw9tXkmXVFujyQ32aRo5bWGRy4K8uP2QRU5zUo/3X4NoVoJhj7Ykas3aul6OfL4rb+e47iJeH0TK2Uc4cn7W8dwtmfbn1xFfrHqssaeJNYy1tYttMsLqpSBiRgrON8WGQ/9lVmoLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/NUlOTAksu3SIrkjO7kDeWqXgTbblrHUv08RZkfJ/Q=;
 b=NXQLvhNDjSD0r9sQ0Eb/XU3YVPGhdHx1dslvKfLFg1/MMr5MNYJ+f1Ov1QOdQLSXRJK/w5gjF3dwCQmYR8slYfiGmDsKv2HJhjwPBJN4slA+6csxVuAu2cuvRZbnHURutJ9JCGSprR78fPdL1GuV70+pFB3vM2TjhdkMmsWZHd8R5z+voNe4V6LKLhr4qUdr56tRH88ST8dOj3/axnZSyvJyJeX+Uw7vo3EtjpHvmDt6Jlty0b73HUbDCakqQNcQsEOS+93Vqyv2Fohpr1UJXHwH0eDTVSjFNPMG4Qz2d50PAQgx5Uh4SUZuc+mnc2VBb7D312NkTr8tobvSNgeCjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 21:36:43 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Wed, 19 Aug 2026
 21:36:43 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 02/10] lib/xe: Use stricter line-equality check
 when checking for workarounds
In-Reply-To: <20260819205513.GR8279@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-2-0c147eeefefa@intel.com>
 <20260729212333.GB7790@mdroper-desk1.amr.corp.intel.com>
 <87ik57b7bn.fsf@intel.com> <87bjaxc3ez.fsf@intel.com>
 <20260819205513.GR8279@mdroper-desk1.amr.corp.intel.com>
Date: Wed, 19 Aug 2026 18:36:40 -0300
Message-ID: <875x15bxnb.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: 462a3d8d-5e87-457a-21af-08defe39f634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: YLZ9UbC3eN7bOqlUWp+83HieuJ0Vax8Mxz14Re1/CKomBE6vUll89D72pIVWO2Ys1seaTlgJXEFOt7+oRcUWZuAIrKfCGIdus/BChoeAHuSIQN4dY/j5FDkJ8j9Q6mVKmBbm71IPQ/H1FTSCPJq4A32KKozDOTZy3Vhvhzy/r743RcnJOABDeKyRVkI+/Cl+j21oMgmBKwIGNdQPVix1GZTlzPUR7AcSuZYKhRgU0j8UbP9gwLMGRZXBaZgxLg2EgJ6Cr20cw151GoC9RoTj/IsLOEgeqiMJFlSPiKjMC03XImXmrKOCEV4UoTwXB1CfFTNSkWoo53rKj9ANf4sqIulAqa+jaW2jDpy8IseYpAsNopIb9OyZCqC+F7z+JjuZS6pvSD3V3DsfSMLAH1jSo9vE7Wf8HyPRJ67lwLbXwGYjTVPWMNlCgQQ8iegtNSu2mjKJYb7bVgmbg3xaF1qXeNNRiHu10KTbrian1qrpo2GLMhxgJA1IcPfLjfAJ4NmSHLKXldnQgRpxvW1AwOWQhmlTjzz3LX7E/PKsWoo0vgK3tcBDDrRe2ddLKjvAfYiNZNiUv/I0I6wkKBYFc0LxKvnUxWDE0nWmSEfn8ImoPZrPSQzapqRqE1TkFDmfLNZiFiOBVluKJBGsgXWPxbRsoaDnSpdjByW3yh+be9zdJlc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fZBj+bffspw1+IrAi58GG+QdlFHtpCvxGrQnVkIYPHUNeEB1K1LoXmKcANsr?=
 =?us-ascii?Q?RQz1qouVRqM85FGmHXS/P/aw4R1hWkKbfkY382uUvMUi3HvpQFTGsj5asxHf?=
 =?us-ascii?Q?AlGBh8LuEBszn903OWk6rU3LW/SnL4c7fENybUhbJUD/5jr543nJY9F/jaO5?=
 =?us-ascii?Q?qBv73jycwF3vSA4sTMzDDRsniyo/E7QlHwtyhlvhgQCMY5cjTOMMz7e4oRAj?=
 =?us-ascii?Q?voko+6pjuF2gNkKrjNqOWxgSRoWt2NdNc2VGuqeGBPUIEUhEED1wNMIf7EO0?=
 =?us-ascii?Q?S2rcYNj74OCtW2q50aQ08hz+nmKGSsMJfx4dkBuJBJQQbJWun2EtO8Z1cXlB?=
 =?us-ascii?Q?IqSrkAWSPsguJMkqTw30xNYa9hIWdD8jwTypsCoVOqNHPLZp692v8xTD6SHu?=
 =?us-ascii?Q?FR1huiZAZ8UaDwiZJ1S5ALTfQs7+6Kn+P63SkABDi4fFeuuxdUocvtAm87qc?=
 =?us-ascii?Q?Ig8/JK1AXZzvG87P7Ic9ZT4HF4i8dd8ZAVWJQSS9ebdIQ7owdvVaZbHyU62U?=
 =?us-ascii?Q?rfmV+BmEGMW+9q4/TlkD3dDcw0k/i/Xzmi9gdviNDivfZA+45Y/jDelXP1MM?=
 =?us-ascii?Q?C/gavzekVYQ+O9vYMIqXmq0eXeZxzdKsJJHGFiG0TxB8d1b9+DoGCeIUJOGM?=
 =?us-ascii?Q?PM2FEqDa0vlHrgkaK8kaO44BA+K0V6SGU78L5oD481ADrU5vOyqtlSCkVyc6?=
 =?us-ascii?Q?GvJNfTh18xriRvlY8nzVBBDoyoJ3V0z8ER+CPlt5JJ1vP96Wqg9DmHB4y2+e?=
 =?us-ascii?Q?eXtkQMvlUQ/Ow7Se1KuAEwgxh2u5E+VXwI48bo6HQoWRvCsZmVfiNihP7hR8?=
 =?us-ascii?Q?4Zzt/fdi0GOSGyQmZtp3eAWJ7D4uyFe7I7MOH7yBTQzdmonJ++YtZPsImFVs?=
 =?us-ascii?Q?5HqL6PvTj2l1Vg6bwzHAdT/ucoVJWlFk+vRKWeP2aF81bNvcl2WT31jazDjN?=
 =?us-ascii?Q?pNvzsMVIzk6lXqpiTqqIIgDNIfFxKhzsRdbhCrvVLc5r6xLUtBCw2BACNMBS?=
 =?us-ascii?Q?f4wV4dQgIV4CJIvdoit1SKshpJTlgQ1UCFY60LbZKmluUk6cVc/sqsoWAcKW?=
 =?us-ascii?Q?ESBKUxr//y5dgImB5vLFdkABRv801DW2/DMbkDUEz3gjD3vkRyhcppeAak5f?=
 =?us-ascii?Q?vA7uR63qI0fUIx+VN3EMWW4wbm8Dq/8D70Y8Hl8+p9DtwxZIGxfslOlh1n9g?=
 =?us-ascii?Q?rHTo9d4GDCQKphgHZs21SEcqzw1zbjiw44SKXThtHcHEXlndw+08/FqO8wHY?=
 =?us-ascii?Q?SbIhJXDQGSacptoiJDNmZ77SM9qCo1TJxdjkCrfOVPeaZSKdVJzHuG0WEstC?=
 =?us-ascii?Q?+4b4mDa2YO/QHky4MwHndYwavY/IMoslwGHzN0odfLPZmFdsvbOU+iiKJ8tw?=
 =?us-ascii?Q?L9+/KMUPf1nl8Pa1ArUx273vfyRIqVc4jre64SLwshYMU9ly5fVp2zWh0H2t?=
 =?us-ascii?Q?rzgLHilSlbiQyYnk6T7TQfgsAcK3DMaXXElBy5o5SFqSPgAj/uXRYLu8KcH1?=
 =?us-ascii?Q?zamaN/CCP6eXEC4p5r90VsUdXTCrfzj/r/HDj6+l/KHKSOOAOjv2lKy7XSqP?=
 =?us-ascii?Q?DrfqW/0n0gv47m+D+KiVpOmLjJO4vZCC9aHhM5M3nJ8xD1oWKqO60E/yN0Sz?=
 =?us-ascii?Q?vBhT6Uo0oL8lYBrVeq0s8+KjrsfdakuXqEvp6rcwWUGTnNYIHBXNUQFT6xOR?=
 =?us-ascii?Q?Hv4T9erCrcfDbxnjUkmfM1j9AG/JN6638c+imTEjHYA8KghYtLA0RtULI068?=
 =?us-ascii?Q?eCdrjpbpxw=3D=3D?=
X-Exchange-RoutingPolicyChecked: R7/hKhajNaY70/NSqLxVsHlnV41X791EnUg/BAQWSR9S9SLIa4B1gSXz2mo8UFsoe7ryT2Zf8lsXoi8IF8TAoP+wrY28cWViezPnzBVOBZDtzFfUS36J2QbXlsjUQSVEE0j5mRTk70dSbiAThWwGZ+jZ+2Tr74s1HZcQjbFG6UYe/ky0zFJSIVzuffc8jutlmnMYDTA4eWCZsorCeri3BXdsAWR5AiRRe1t+3Q7PUIYWOIB5CLjV24a/bn0CJi6uKNUjO/vTWxJElGZ5AtT9+89iqmTu0Uww/qews8rH6mtPRCExHIyo8SwwPTf4tcU8TQ/5bZytj4eq8YV3gjI8oQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 462a3d8d-5e87-457a-21af-08defe39f634
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 21:36:43.3676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6AXumB25gTlzk4Ch/p5XWqhdIcWYlak0lywT6xdKHnXumAjfmn+jemoEDFOUuI+3ehZtGC+8KsDSXVxK5JyRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Wed, Aug 19, 2026 at 04:32:04PM -0300, Gustavo Sousa wrote:
>> Gustavo Sousa <gustavo.sousa@intel.com> writes:
>> 
>> > Matt Roper <matthew.d.roper@intel.com> writes:
>> >
>> >> On Tue, Jul 21, 2026 at 03:59:55PM -0300, Gustavo Sousa wrote:
>> >>> Currently debugfs_file_has_wa() uses strstr() to check if a workaround
>> >>> name is present in the debugfs dump.  Using strstr() would match the
>> >>> workaround name anywhere in the dump buffer and with that we risk
>> >>> producing unexpected results if the checked workaround name happens to
>> >>> be a substring of another workaround present in the dump.
>> >>> 
>> >>> Fix that by making sure we match the workaround name with the full
>> >>> line from the dump.
>> >>
>> >> There are other parts of IGT that use regular expressions from either
>> >> POSIX (regcomp / regexec) or Glib (g_regex_new / g_regex_match).  Would
>> >> it be possible to use one of those here instead of opencoding a match
>> >> function?
>> >
>> > Yeah.  That could make this function more readable and easier to extend.
>> > I'll take a look at those options.
>> 
>> This new version of debugfs_file_has_wa() misses the fact that some
>> lines will contain multiple workarounds separated by comma.  So I
>> decided to implement a more robust version.  I have two versions, one
>> that is still not using regular expressions and another that uses POSIX
>> regcomp/regexec functions.  I have a slight preference for the former,
>> but if you prefer, we can go with the latter.  IMO, both versions are
>> more readable than the one currently proposed in this patch.
>> 
>> I would like your opinion before sending v2 of this series. :-)
>
> It might be best to ping the IGT maintainers and see what they think.
> Today IGT has a mix of open-coded string matching and two different
> styles of regular expressions.  It seems like the kind of thing they may
> want to set a standard direction for with new code.  I don't have much
> of a personal opinion.

Kamil, do you have a direction here? Feel free to add other maintainers
as well.

--
Gustavo Sousa

>
>
> Matt
>
>> 
>> Note: I also created a separate commit adding a simple test for this
>> function in lib/tests.
>> 
>> Version without regular expressions:
>> 
>>     | static bool is_eol(char c)
>>     | {
>>     |         return !c || c == '\n';
>>     | }
>>     | 
>>     | static bool is_wa_sep(char c)
>>     | {
>>     |         return isspace(c) || c == ',';
>>     | }
>>     | 
>>     | static bool debugfs_dump_has_wa(char *dump, const char *wa)
>>     | {
>>     |         size_t wa_len = strlen(wa);
>>     | 
>>     |         while (*dump) {
>>     |                 /*
>>     |                  * Each workaround name is indented by one tab
>>     |                  * character; unindented lines are used as "section
>>     |                  * names" identifying the type of workarounds that
>>     |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
>>     |                  * etc).
>>     |                  */
>>     |                 if (*dump != '\t')
>>     |                         goto next_line;
>>     | 
>>     |                 while (!is_eol(*dump)) {
>>     |                         char *other_wa;
>>     | 
>>     |                         while (!is_eol(*dump) && is_wa_sep(*dump))
>>     |                                 dump++;
>>     | 
>>     |                         other_wa = dump;
>>     | 
>>     |                         while (!is_eol(*dump) && !is_wa_sep(*dump))
>>     |                                 dump++;
>>     | 
>>     |                         if (wa_len == dump - other_wa &&
>>     |                             !strncmp(wa, other_wa, wa_len))
>>     |                                 return true;
>>     |                 }
>>     | 
>>     |         next_line:
>>     |                 while (!is_eol(*dump))
>>     |                         dump++;
>>     | 
>>     |                 if (*dump)
>>     |                         dump++;
>>     |         }
>>     | 
>>     |         return false;
>>     | }
>> 
>> Version with POSIX regcomp/regexec:
>> 
>>     | static int debugfs_dump_has_wa(char *dump, const char *wa)
>>     | {
>>     |         size_t wa_len;
>>     |         regex_t regex;
>>     |         regmatch_t match[2];
>>     |         int ret;
>>     | 
>>     |         if (regcomp(&regex, "[ \t,]*([^ \t,]+)", REG_EXTENDED | REG_NEWLINE)) {
>>     |                 igt_critical("Failed to compile regex, workaround %s will not be checked.\n",
>>     |                              wa);
>>     | 
>>     |                 return -1;
>>     |         }
>>     | 
>>     |         wa_len = strlen(wa);
>>     |         ret = 0;
>>     | 
>>     |         while (*dump) {
>>     |                 /*
>>     |                  * Each workaround name is indented by one tab
>>     |                  * character; unindented lines are used as "section
>>     |                  * names" identifying the type of workarounds that
>>     |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
>>     |                  * etc).
>>     |                  */
>>     |                 if (*dump != '\t')
>>     |                         goto next_line;
>>     | 
>>     |                 while (*dump && regexec(&regex, dump, 2, match, 0) == 0) {
>>     |                         char *other_wa = dump + match[1].rm_so;
>>     |                         size_t other_wa_len = match[1].rm_eo - match[1].rm_so;
>>     | 
>>     |                         dump += match[0].rm_eo;
>>     | 
>>     |                         if (wa_len == other_wa_len && !strncmp(wa, other_wa, wa_len)) {
>>     |                                 ret = 1;
>>     | 
>>     |                                 goto done;
>>     |                         }
>>     |                 }
>>     | 
>>     |         next_line:
>>     |                 while (*dump && *dump != '\n')
>>     |                         dump++;
>>     | 
>>     |                 if (*dump)
>>     |                         dump++;
>>     |         }
>>     | 
>>     | done:
>>     |         regfree(&regex);
>>     | 
>>     |         return ret;
>>     | }
>> 
>> --
>> Gustavo Sousa
>> 
>> >
>> > --
>> > Gustavo Sousa
>> >
>> >>
>> >>
>> >> Matt
>> >>
>> >>> 
>> >>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >>> ---
>> >>>  lib/xe/xe_wa.c | 39 ++++++++++++++++++++++++++++++++++++++-
>> >>>  1 file changed, 38 insertions(+), 1 deletion(-)
>> >>> 
>> >>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>> >>> index ff5daf529831..d44431e7e61f 100644
>> >>> --- a/lib/xe/xe_wa.c
>> >>> +++ b/lib/xe/xe_wa.c
>> >>> @@ -13,6 +13,43 @@
>> >>>  #include "xe/xe_wa.h"
>> >>>  #include "xe/xe_query.h"
>> >>>  
>> >>> +static bool debugfs_dump_has_wa(char *dump, const char *wa)
>> >>> +{
>> >>> +	char *a = dump;
>> >>> +
>> >>> +	while (*a) {
>> >>> +		const char *b = wa;
>> >>> +
>> >>> +		/*
>> >>> +		 * Each workaround name is indented by one tab
>> >>> +		 * character; unindented lines are used as "section
>> >>> +		 * names" identifying the type of workarounds that
>> >>> +		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
>> >>> +		 * etc).
>> >>> +		 */
>> >>> +		if (*a++ != '\t')
>> >>> +			goto next_line;
>> >>> +
>> >>> +		while (*a == *b && !(*a == '\0' || *a == '\n' || *b == '\0')) {
>> >>> +			a++;
>> >>> +			b++;
>> >>> +		}
>> >>> +
>> >>> +		if ((*a == '\0' || *a == '\n') && *b == '\0')
>> >>> +			return true;
>> >>> +
>> >>> +	next_line:
>> >>> +		/* No match for this line, advance to the next one. */
>> >>> +		while (*a != '\n' && *a != '\0')
>> >>> +			a++;
>> >>> +
>> >>> +		if (*a == '\n')
>> >>> +			a++;
>> >>> +	}
>> >>> +
>> >>> +	return false;
>> >>> +}
>> >>> +
>> >>>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>> >>>  			       const char *debugfs_name, const char *wa)
>> >>>  {
>> >>> @@ -23,7 +60,7 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>> >>>  
>> >>>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>> >>>  	if (debugfs_dump) {
>> >>> -		char *has_wa = strstr(debugfs_dump, wa);
>> >>> +		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
>> >>>  
>> >>>  		free(debugfs_dump);
>> >>>  
>> >>> 
>> >>> -- 
>> >>> 2.55.0
>> >>> 
>> >>
>> >> -- 
>> >> Matt Roper
>> >> Graphics Software Engineer
>> >> Linux GPU Platform Enablement
>> >> Intel Corporation
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
