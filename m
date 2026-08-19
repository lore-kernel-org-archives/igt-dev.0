Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0DFC5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 19:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3FA10E02D;
	Wed, 19 Aug 2026 19:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDQoLRgP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88F510E02D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 19:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787167932; x=1818703932;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DgbjvVrOXQOKU/LikyvRN+KX6gSfxTCRZBVjjqz4k6s=;
 b=ZDQoLRgPalDurwv4hc9ORuf4PGRIvyPArQSq8GFcXSqu3Cy8nxlfa+D5
 OxCH8GOfAIwSGCNFqiJN/wbVkdgFLEj9Jo71WpgQG7DnNdGknwOXaKtqT
 dBgwnwlmu+SUSC08zniQ7SGtggRBFGzhWe5zv6478M76EnRnZu3vW3vCT
 dU6RYquoquHzBF+VcS0M7xHH3DTfYqEZOcT49w6NOKXGzd7g2IU1eMHpE
 4egPgSw9bI2dzpkGgcyAxAkGdshfoG9eP3Tka4ItsyTQbiUCSHcbjto/9
 OYTa79Nf/rPMOHMv90hj5wMAHBcKaeecgsEvVKirJ2Zv1sjptgPD1N3/t w==;
X-CSE-ConnectionGUID: MhHCLvmJQjO9njqAGayT3A==
X-CSE-MsgGUID: 141Jqy/IQiCUYM2FyrQF1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87555134"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87555134"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:32:12 -0700
X-CSE-ConnectionGUID: MNJGoyGARqeqLvzU5fVPPQ==
X-CSE-MsgGUID: /fhCkut1QVawL4QtDdznxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="266254346"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:32:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 12:32:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 12:32:10 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 12:32:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRmJ3lWfseTVNfXh8XYRKsGdW6/KA56SwoI3Z5ROObQXq9wn72pKxXS4VzIqN+BGsQTWNNxRQxHhwLpGiyCymLgwVdHDodQuaQOTQBgouK9Mlmp4jKe2TAfQ4AQqqkHyTtgY9b08FfLDcnEP7JGwxMB8nb7tcVPA6ydHms8k4Pz8otNMs4qMvFvWO/XpD1doJmW8663FzUZ0aqar7ZLTIgFRlyws4GQuf28DHpUutbfWZs0YqYRHhEt1zDLuBksCRFPj522bGNhrpkEPsEkPYOZF1X2ZozUetajzOxVOfB4PizIQ9bJy4pRXg5kEWUE+GRq1RDt8kdugFu7CP/yq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGRdilPji2wFuZAfikF/aiAg4Dk34fGfxvbXBP74j5A=;
 b=xby8/MFVmJeRLH5z4rFuwe2P/Qb9ZsS0Fq6hu5a5FC9gt1rbcssiArNWp2vwc6GXdsC1FDczp861bNmlPHIo2jRuN1ES4xoNL6VM8SpfbOO8nvN0IgQDIdDrwh18Migb02lYu6eljSuJGI7qCANqL1O4AtDgUJNDt/tE/BeAvAqYwnxcyERHHfZ97qeeoflO71CTs1gBiPSJy8B5/Fl6W0kFthCqVrkzqobdXNgcSh1QFuNoCbNPwVlef14iJTcTDD6EN7SqACTAUR/1479Xyjga5EuvXRQBpfRwNTLZxvUWwlhoaK//S35fo9KNLFLj/jKvXEim7ZyIVA7S0s5/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:32:07 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Wed, 19 Aug 2026
 19:32:07 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/10] lib/xe: Use stricter line-equality check
 when checking for workarounds
In-Reply-To: <87ik57b7bn.fsf@intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-2-0c147eeefefa@intel.com>
 <20260729212333.GB7790@mdroper-desk1.amr.corp.intel.com>
 <87ik57b7bn.fsf@intel.com>
Date: Wed, 19 Aug 2026 16:32:04 -0300
Message-ID: <87bjaxc3ez.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: ab12b7f7-f5c7-46c9-1642-08defe288e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: tI6uJCLTQMNZGiU+/xERI9yjeUbQ6rm0lYciM3+UzzaOawNRYNVbEYciTw0F7DiAX/YWGjNqEk/gqJbTjUoKSdmxg0FTay/WH06F86Xy+oMm+swydjSqecf4i+nC+tqhvWkoQIy3HvW4Ryi/8N7zW7QjznEjaFXQc2DhHIINsklbZ65c7j07bhO3EVIeBNgC8/h33/OpsPF6kkBtwhO3CJUQvW1BN0jQ/IhvqKiAddrDuXxpynnYOJyQz3NZz8z4vPv7kmDiDFQfc4BrZGO7vb8WASQOzNL60gTw9l8T3SwtjozPQBf8bdjhYnqhT+XANkd/nsLlCK85nMYhz3B25G5CJOuImC5ly0CVeUeE5tKZQ+qUAKKOErUQ3qZjNXsV5txqCZCU8q9SHSx1wuP0Nh+IeWeJ3VS/tsGnm0HYn+MhPWDap3AVCTrJX5LsrJ+ErbXFkHQc285lKKpu18eahXmyk/GsxWYCbo56WsChYfdBYSqLLnYkAqJGbzfqbtbieLHZJFjuZG809g0ZAXtQiYR2QPp+O5tWQXQydaIWndhnhUsA9DYotIiR253+d+sydwm6ELMglLfvUG85pi3XXrzDz49CJ84Mfyq0mQ/FWPb3GgE9vR1haCpiucKTkEmlVK/0tGl6kSbmPjguFiytA2bcXjVm8FTPZBst/yZ3BbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AZs1yprgfGPM7oA/qcFqCoZoWWZOIC/52yYG3I5btj5pKY6Bc9fkWjp3bQzS?=
 =?us-ascii?Q?mVQ2km0gPBU2ddOuHFadOANZQ72BhpbahmepG5V6gF4k4Idzux6mlGaePQfd?=
 =?us-ascii?Q?NWVvR17vs1mecADptmRJI0ymMX+vW7wG4tiWKxCDdL1wRMyM+sxJOBXZBhtD?=
 =?us-ascii?Q?BIISwJc3A8xqZFOFxDjBBi2ni0gr6PMz/sxzySyIYYuxt1fFGdVayaNvIjfv?=
 =?us-ascii?Q?Xfv4T8VNvAxilOWyVaTOzujogrXD2lqkhGLfyxkcnHrVAy3oPdszjzQIZRnz?=
 =?us-ascii?Q?Ae5ke6N9t8yMmTDUu9VDTXlv5cxZ0G5j2Mq8ezpZpoiu6nCnpL5IeImehUF4?=
 =?us-ascii?Q?arFIBfMRPOErBtv3a00gvaBHp4SBEn+QjXrxm1+Z2GQ/qBK5Tm6uz5Ro4cBA?=
 =?us-ascii?Q?GxSKbrrT5WUBitxujVtoXxAeIILM7AeZIuNGcPnYIbvK4ocVukxgu0EMp6P1?=
 =?us-ascii?Q?GD3sy1oOPfl7TnNCEpyCAe5n+PGpU/4k23H6Mmru4FimwZNyZ4CJApVhGLKR?=
 =?us-ascii?Q?I20PtF2Pk14Lj5OQLpeOd7s/dhuO0Trvzk+quZR1sjPnFdQMjBVNh15tKgTq?=
 =?us-ascii?Q?8P3doRAlm2Gc1hliCUOcykODcqtf2/QWD1KKj5rs39Dyax5fbzWGIcE2I7U2?=
 =?us-ascii?Q?mdMuLwgKPQUceZ0nGlQUSbY+igBaHRtUawiizL3ssjlJntc/hFMgIGIYwm9V?=
 =?us-ascii?Q?GT+fgGtu1E+zpfVqnCDUKcwR1ofhC/O+43tr8R9e8rtMqlBXNDQoANkU8eO/?=
 =?us-ascii?Q?nSEGgpeoR6Tu5cRLkOj8Z74+Q/Jrw5jiihfke5wlSo+YPksbiBg3E7VpEdD0?=
 =?us-ascii?Q?2DlcQUcCt+VB12Wq4HQ4ApSuu25GsR7k4xa4vQg3+yxDznuJFCfp9T/ke3+o?=
 =?us-ascii?Q?Bom55HE9PS0cQMt5t9sP+5BZ99XBnToSy9aQYS0xPk3STwCtw7jhJamD2ljh?=
 =?us-ascii?Q?fCVRl1mIK29gNivZ/FoUQ7lPJstVMbP7zXMprhcGtZQy4TJZ0v3nKWoBNCKU?=
 =?us-ascii?Q?nbV9FyKRN2FnmHrp0kaqWJPKO01ZapioLsgozhU4mu1geGoMqgZ79OtcgDYU?=
 =?us-ascii?Q?JhNXqpqYMt/qA6IbCKccljJokacN1BMaJ+OLYSTJsWsfUSGwivoV8oZd9gca?=
 =?us-ascii?Q?/59r9SEbmNVh30+jygJ1YP4irF3i9I89+jOk4pjMaVfsc8HiehUOItwN7JgN?=
 =?us-ascii?Q?+LxQBVzzc5jHFg6ySpw46WXG+0urjEgBB9LEpuPYgtOOF3LhRpag3rk7cGSb?=
 =?us-ascii?Q?7JUdi2fcwS8rx1QA1RIdCgyL/0XVqwQg8ftmPWJbR54REl7ZwMO+dnoD+3FK?=
 =?us-ascii?Q?syz44mqHx5+fyF7fAbN0AS8o6nXj0By0STsUIi10rOyoY2qp1hRhoT19Vd4t?=
 =?us-ascii?Q?IkgrJfHc1DAbYL9c7KbnqtYsxxnfI7CrGbsM/Oc8IlidTU0uep7iBpTRFJbz?=
 =?us-ascii?Q?oigafdqENxXOwZWZn1Q3W3F0ybXhkAavn+L2uJ0cKg998Xjs7WrqFOMnleme?=
 =?us-ascii?Q?VYAy99z6nN/vIRfuz7qsm9petcRnnLR6NYwjLSw5Hx/jF6+lgSd2aUau//Bu?=
 =?us-ascii?Q?5YktEK2WxdTgzckRuRTd4IR2Os2Jya17oKdrBwtr8kww8RPseuDMuY0ctGpS?=
 =?us-ascii?Q?SLzWtF8kn7wsWXCXVpbDuo+Qzlx9lDypDscPzfI5UHjZI3qu/PE73eX8o9en?=
 =?us-ascii?Q?+/FUlBj8ZX9e/HfOp65XU0gVvsnubmGzwBf5uzJU0aIwlZjzLXCUhTuekeWy?=
 =?us-ascii?Q?prD09lbjpA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Y8i9/IW0abcV2sy34yFQbuGxO1/wurg5L0dtlpRL8cBGQ3ITAhSxU/0XDegaeZLpl8AaTFNMA5+u/rw1DOzPQxNY8zjniHPhQtH+Ii2DIIkUX7zFK12y2SfkvHR08IqpNM7xhILg8PT1l0/B2xlc8uTvLVWWMlwYJ+Ys0b6UDqp9jmW2J7RABW+tKLJizvXRP9hBfyAIC7bWd3Tc/6WXqoD7+86a44nDPrpECbMoVrcsKa4IkJjjgZss444Y3PX2sYHNR0fObbWJjhUZqbavvbqZKaYSofF9xGWVNcqyAb9WARlBcYToskRRDVPNE9UCj7qN/8xo8Y/HXXdrfmvz4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab12b7f7-f5c7-46c9-1642-08defe288e37
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:32:07.3359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjsIqomIUk8A4cOQwEsuQy38iS8Zqvrew8g+MB2ohh29OL6opuOdnU2o8n0k0qFwtEpSLR+Lg2K51y8t8VW6VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8264
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Matt Roper <matthew.d.roper@intel.com> writes:
>
>> On Tue, Jul 21, 2026 at 03:59:55PM -0300, Gustavo Sousa wrote:
>>> Currently debugfs_file_has_wa() uses strstr() to check if a workaround
>>> name is present in the debugfs dump.  Using strstr() would match the
>>> workaround name anywhere in the dump buffer and with that we risk
>>> producing unexpected results if the checked workaround name happens to
>>> be a substring of another workaround present in the dump.
>>> 
>>> Fix that by making sure we match the workaround name with the full
>>> line from the dump.
>>
>> There are other parts of IGT that use regular expressions from either
>> POSIX (regcomp / regexec) or Glib (g_regex_new / g_regex_match).  Would
>> it be possible to use one of those here instead of opencoding a match
>> function?
>
> Yeah.  That could make this function more readable and easier to extend.
> I'll take a look at those options.

This new version of debugfs_file_has_wa() misses the fact that some
lines will contain multiple workarounds separated by comma.  So I
decided to implement a more robust version.  I have two versions, one
that is still not using regular expressions and another that uses POSIX
regcomp/regexec functions.  I have a slight preference for the former,
but if you prefer, we can go with the latter.  IMO, both versions are
more readable than the one currently proposed in this patch.

I would like your opinion before sending v2 of this series. :-)

Note: I also created a separate commit adding a simple test for this
function in lib/tests.

Version without regular expressions:

    | static bool is_eol(char c)
    | {
    |         return !c || c == '\n';
    | }
    | 
    | static bool is_wa_sep(char c)
    | {
    |         return isspace(c) || c == ',';
    | }
    | 
    | static bool debugfs_dump_has_wa(char *dump, const char *wa)
    | {
    |         size_t wa_len = strlen(wa);
    | 
    |         while (*dump) {
    |                 /*
    |                  * Each workaround name is indented by one tab
    |                  * character; unindented lines are used as "section
    |                  * names" identifying the type of workarounds that
    |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
    |                  * etc).
    |                  */
    |                 if (*dump != '\t')
    |                         goto next_line;
    | 
    |                 while (!is_eol(*dump)) {
    |                         char *other_wa;
    | 
    |                         while (!is_eol(*dump) && is_wa_sep(*dump))
    |                                 dump++;
    | 
    |                         other_wa = dump;
    | 
    |                         while (!is_eol(*dump) && !is_wa_sep(*dump))
    |                                 dump++;
    | 
    |                         if (wa_len == dump - other_wa &&
    |                             !strncmp(wa, other_wa, wa_len))
    |                                 return true;
    |                 }
    | 
    |         next_line:
    |                 while (!is_eol(*dump))
    |                         dump++;
    | 
    |                 if (*dump)
    |                         dump++;
    |         }
    | 
    |         return false;
    | }

Version with POSIX regcomp/regexec:

    | static int debugfs_dump_has_wa(char *dump, const char *wa)
    | {
    |         size_t wa_len;
    |         regex_t regex;
    |         regmatch_t match[2];
    |         int ret;
    | 
    |         if (regcomp(&regex, "[ \t,]*([^ \t,]+)", REG_EXTENDED | REG_NEWLINE)) {
    |                 igt_critical("Failed to compile regex, workaround %s will not be checked.\n",
    |                              wa);
    | 
    |                 return -1;
    |         }
    | 
    |         wa_len = strlen(wa);
    |         ret = 0;
    | 
    |         while (*dump) {
    |                 /*
    |                  * Each workaround name is indented by one tab
    |                  * character; unindented lines are used as "section
    |                  * names" identifying the type of workarounds that
    |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
    |                  * etc).
    |                  */
    |                 if (*dump != '\t')
    |                         goto next_line;
    | 
    |                 while (*dump && regexec(&regex, dump, 2, match, 0) == 0) {
    |                         char *other_wa = dump + match[1].rm_so;
    |                         size_t other_wa_len = match[1].rm_eo - match[1].rm_so;
    | 
    |                         dump += match[0].rm_eo;
    | 
    |                         if (wa_len == other_wa_len && !strncmp(wa, other_wa, wa_len)) {
    |                                 ret = 1;
    | 
    |                                 goto done;
    |                         }
    |                 }
    | 
    |         next_line:
    |                 while (*dump && *dump != '\n')
    |                         dump++;
    | 
    |                 if (*dump)
    |                         dump++;
    |         }
    | 
    | done:
    |         regfree(&regex);
    | 
    |         return ret;
    | }

--
Gustavo Sousa

>
> --
> Gustavo Sousa
>
>>
>>
>> Matt
>>
>>> 
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>>  lib/xe/xe_wa.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 38 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>>> index ff5daf529831..d44431e7e61f 100644
>>> --- a/lib/xe/xe_wa.c
>>> +++ b/lib/xe/xe_wa.c
>>> @@ -13,6 +13,43 @@
>>>  #include "xe/xe_wa.h"
>>>  #include "xe/xe_query.h"
>>>  
>>> +static bool debugfs_dump_has_wa(char *dump, const char *wa)
>>> +{
>>> +	char *a = dump;
>>> +
>>> +	while (*a) {
>>> +		const char *b = wa;
>>> +
>>> +		/*
>>> +		 * Each workaround name is indented by one tab
>>> +		 * character; unindented lines are used as "section
>>> +		 * names" identifying the type of workarounds that
>>> +		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
>>> +		 * etc).
>>> +		 */
>>> +		if (*a++ != '\t')
>>> +			goto next_line;
>>> +
>>> +		while (*a == *b && !(*a == '\0' || *a == '\n' || *b == '\0')) {
>>> +			a++;
>>> +			b++;
>>> +		}
>>> +
>>> +		if ((*a == '\0' || *a == '\n') && *b == '\0')
>>> +			return true;
>>> +
>>> +	next_line:
>>> +		/* No match for this line, advance to the next one. */
>>> +		while (*a != '\n' && *a != '\0')
>>> +			a++;
>>> +
>>> +		if (*a == '\n')
>>> +			a++;
>>> +	}
>>> +
>>> +	return false;
>>> +}
>>> +
>>>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>>>  			       const char *debugfs_name, const char *wa)
>>>  {
>>> @@ -23,7 +60,7 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>>>  
>>>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>>>  	if (debugfs_dump) {
>>> -		char *has_wa = strstr(debugfs_dump, wa);
>>> +		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
>>>  
>>>  		free(debugfs_dump);
>>>  
>>> 
>>> -- 
>>> 2.55.0
>>> 
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
