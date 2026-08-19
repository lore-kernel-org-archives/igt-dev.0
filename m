Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F32C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 20:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25DF89CC1;
	Wed, 19 Aug 2026 20:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhKQj4ju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F3D10E183
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787172929; x=1818708929;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NiY7vbFp9fhCu06x7JK4E2woy0Ytsk03D6fFxFtqer4=;
 b=PhKQj4juqMa1+dWk99NcZZOwsZMhyI8XrHze7GaMSVj/dgVfyxdUsbQS
 cln5yAxwryOJRr37+nhTdTQj8Vx1fDGeogwtLD+TPI3xBrE/yQ5tBpmx9
 r/+Tw/ON1LXQ6CayR+PpxHYTssuxgtlurMnCkJczRkA4lJrftvu38Ekib
 xCXS45X/052FFefPWt44eha0P+CC1eBBDUBZxBL22kjYR7IhIOULQpiwb
 XnOukWsVJbLOoTV5EESSkll6M9U7YjK1mL7TNXAGJRDGbv32x44zVHip6
 H7EQiwRzYG2TUPrbtu07r+hbp4Seau6RrJrH13oZ9vXfzWT/ZN0lFTKbV w==;
X-CSE-ConnectionGUID: oohPx/XmQUa58ZSlLr1uDg==
X-CSE-MsgGUID: cdzGQBFRTdKdwvkJoIo+BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91382180"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="91382180"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:55:28 -0700
X-CSE-ConnectionGUID: qpOe4OPlQ4+FCRMtS8veNA==
X-CSE-MsgGUID: tXla7n4ZRgSPip35d+NIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="270870042"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:55:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 13:55:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 13:55:24 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 13:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkIMmU1OyuYcjO+uMLSSFPiSyJYNFIdBtEo4olAdko3/S+5YYwMlZguxkdgNWdDXW3VBGwwdnDT6e3Q374Xsy1x1/oEEmi1tIyuzfSFunpVHQmFHdt/q4iWaB7GOvxVujXm12CW9S+t00dMeZw3htYlr/KE39QJPW5ECNuOzlxFdF25/nXZ68MZ5PELN8SnBAlMHTkKdNHg59XIEHTH39NdosPwsuCVctt5IxCQScAeIfhICDU1iDkaELSNhP68wcxhmLwaAnY+tF2VR180AaR8S+Ggp0JizPqtHS4mUZAxVCrj4UGCDwEd5CLvkBn//8EAH1fLMa5TCIlNgKW+I4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsXsD5cHmrcx3htkz1YLaXx9BwK8SHsjmqV4ml+Jiso=;
 b=a1KUWeYgjZzRCMhGu8GrFwUEaYLSPRpfKXm2lEl0FqV97kYOtnVaCms+GRN0Q+G0x0JIqftjaqELAOYejhekkCnIx7jf1404wGX+V6VeoqPnjdloXS9YMgdMTAyAxmPJtRer6r8iA9/P0A+hVzWZUPzW0ulTWvES/1lzbFx+avhM/5Y7nhzQVEHK9gAvZgZenoGBjSC2vQX/VX1Q+1nCMFz5jwWqke3pIzQt5svAJMuRtX+rGKYZuQteP9rTn9e7EG2sXhe1uc99I7s+3mt6Y9mcbLa/dZ4iohBPmy1orvGPkc/9m56ULH4kR7dHNYhRrNxm06PK2kSJ/3TNdEJRJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7942.namprd11.prod.outlook.com (2603:10b6:208:3fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 20:55:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 20:55:15 +0000
Date: Wed, 19 Aug 2026 13:55:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/10] lib/xe: Use stricter line-equality check
 when checking for workarounds
Message-ID: <20260819205513.GR8279@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-2-0c147eeefefa@intel.com>
 <20260729212333.GB7790@mdroper-desk1.amr.corp.intel.com>
 <87ik57b7bn.fsf@intel.com> <87bjaxc3ez.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87bjaxc3ez.fsf@intel.com>
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: e125e27d-99fd-4a2a-a3ca-08defe342b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: C+kjWghGlGmyHnna5ajPEwHVjb7PE6yUohq13S7TWLRxrmvSD0NsuHKKRhEVPavrfIr/bQRyMl20l4QEmEZisyDwJf2BwLg8Irixc6EJFhvDT9dgLukIje76mSDkO+UOjXIl63G/nHmZBnEq3Wr7eUA3tp0fX02RqkM6XfUdASKSIBO/Rkv9kG/ew5yfIpl2ij2CxiZoMaBgyfg4OZFZ0QdeY66/6tsN4hx5nldTDCyXvSUj6iScPir0iJPA8+f1Q/gCDyyq4Dbng3BOTi47B5a/rHVwt/vxAJb9QQBnhm+99o/njGPpKjV+bqvX34i8epL7YKsnz4eMcd5qhFbYJHgJmRsLVjhlawFUmFTg6VAKqSMdxd6rawmCgtcvBf3jnTHw6zWEhdCdWXOq+u8pRO/PpmYtVlI9mGhi4HgJZAU5QVx5pkCgnYpus5Kl/PrUuRc67L91ba44PIXKMt235hvyQBUiexkZs0WOJTrtD9m52yPXW4YPVSGcnssj+Dlmc9agbQncXtolRL9RIZ35f6LEoIOF1FALPkpB7qxu7cz5GgIikAjC09g9Yosg5TaUBGwjt/LDmBnlQ8yamuIBrBzltPUFWtCsNBqdoqbPujJgszoO0VX549TO66d24EfARylkT0sGcnuGlk3ee565Rp5vdkj86gclUNBvnmlyu5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VoRjto4wdM24enNgrFsX/MbL/HPpl3snYjoQl0OeEAG3XJNtHxbn+1FfPW3Q?=
 =?us-ascii?Q?j2SKeaUc/bAaFY7hkT5PHHUjkVMgRuGxAVeq0lv7sxOkhl+XjzmyquoMjvsZ?=
 =?us-ascii?Q?hEz8aFJDVDKGhhTUAkjODyyoze5xTRmXkQgz0eOe4ZBwHiupSMcXJQHnBR+v?=
 =?us-ascii?Q?oPPVC4k5+pH16d0sJ320s0l08YQxxmDWDUxDlJpb4LMvF5D8yaXOqfji0Kza?=
 =?us-ascii?Q?6oNo6VwyjH+6VlxJnYM+8DPEVHxJidEBFcQV3Zyhem026Gbux+sTgtncl30c?=
 =?us-ascii?Q?bIkbeSnN0sWmfO4on1gw9WHYosntx30GnrXeDaTCPQ2BvftgagqA7+Fc/01p?=
 =?us-ascii?Q?qYErbge99SrkH2eCr9R4x+cojLrTGpYZmJJ8zWDPnaHjty27v3kAtjbMDi7k?=
 =?us-ascii?Q?v3dOmevyYhB8j8JjbPlh9X/ioscIHAVkNSmxV9JMpYj07/ORpJE6wEFhuDjq?=
 =?us-ascii?Q?Cyw0GynQBzvCeNIZdyLQQzTJpCMfkDDAoqk0McDfu8M73XUaQ/5OzYW20kmA?=
 =?us-ascii?Q?JUMPEJuYaXeyyHeu1ATo45Cqnm1gi6WtMsev9ONMoFiol8Oreg15utnYHl+Y?=
 =?us-ascii?Q?hEi8PE8qtsiWV0xgDoMzrKgcNoXBUTYUSMUQANjCB0whaY8hxa/T1ALp8wzI?=
 =?us-ascii?Q?UXxixeyoiHQrt2KODx8Ak7GMtbMXEqBZTwecxQp6Y4jK1ifJiS7G0co4aWMt?=
 =?us-ascii?Q?6kXJm5lUPHa+dtnMxMx+Q9g3VOOCAUoFv8wdW1LbbsH1eIUeQcnfpocILCcs?=
 =?us-ascii?Q?GdFuMFsJ9U1D/ErPHysvTdz3bDQtMBLcjm/UAYrChhAjyj8MWQk+9hWe0KRv?=
 =?us-ascii?Q?+ZAqTGKWqD10PsBh9svm5suKeHLL1pL80xnqwO0D3ZL1gjpVaQmK9usmJsbs?=
 =?us-ascii?Q?3Ok24vL0/jA2blkIQNMkJD0CQxlip/5D42mf98lQDnEpkF4sS9BXbYkynFZG?=
 =?us-ascii?Q?6TEe2xUskBmTeAUQ9wduLmvh3pZSoupNK4kZMulKBV5jAuH6AvJZrMEM/0Lf?=
 =?us-ascii?Q?fXsM2euBi14OymojIEdUxz3iBlu1/CyyQweG83rGsoAXt38TcUF3Bfp8mvF/?=
 =?us-ascii?Q?4oAddzvoG3nEJE4dF8hESuUarIAsDs4iv8VAY8ArlwujxbIleA1NFJ2hi3LO?=
 =?us-ascii?Q?NOLTNRm/8Bdnjfq/gWMjPICd/5F2ghM4gOlpbY8drDbn3L/DAEEMvLgpslYm?=
 =?us-ascii?Q?VIuCmGff7Ocp7PAOWIOIgfarfoEDmI+rXWbjdjEKchS9rReoTadk1+lwpLrl?=
 =?us-ascii?Q?8caw0K0C60mqeM9m3Rhyi4CeAbcQRb4njhjtTCKeXU/uFmQNQGEv1bo63XxI?=
 =?us-ascii?Q?9s675wJc/gT/qCbu8OuPNHI5jPQc8fIRMkcRqmaY7/0g+EOEX5e4GQyDFGFL?=
 =?us-ascii?Q?/T4imQ2o4OGsrySG1p6Eiyd7xZqi8hidzs1jvcpyn4nCjybtAtkJNnPmBO57?=
 =?us-ascii?Q?3oEEYMwL9eYbCcxzlt0QfAlQRFug39cl/WzhzVMqYg6CM6bK2adCc0uO4Y40?=
 =?us-ascii?Q?DSnQlO/5GZ1q8kGtZqob5fQlEjw+eYzvEyS/tKBbW6u5aJq8lyAxtEwyPgib?=
 =?us-ascii?Q?3fuOUtiDI2WdQKR/qGe+uXBWgkCdxcZtdZP4SUCWZPz8ont5UCSMq1S6IvSx?=
 =?us-ascii?Q?jcrixbxpKFxbHK+hgdCJifcezgyhVl6Cv8vdIDr053SQt4W42rhz5qsfMwiz?=
 =?us-ascii?Q?0Wa5jDhn4cMcvrNAPR/M+UTL5/5K4B0DFczmpTbJUFWMDrEMf+F55HCt1G8M?=
 =?us-ascii?Q?UpwAPKTP3HPSuIQooQJkH4yoCmUUy/c=3D?=
X-Exchange-RoutingPolicyChecked: BQxhw505oerqsaHzV5ZJHUfl9jpQOV9BceIcZZirClJIcbMbh9S5dkof5ZnPCEkCjTzo2SOeaO6dT2LN9WxYdqJiLk0UpjN20L9XM1ORNl9WM6Alc/ED1RM786aJq1YEQvUG1cDUJ6KVFRlEqFzOrhLj8754C+MuXmhur8GEQZZpGOg7YA3O01sDN+ew6vWJFCgGmCsEEwOBPRrPU1mHPyzB2fjnJx2i0fWIJmqDcIgJ8xxKkfhG3K27W11ogOwZ9BwntRl4c0orv+ywaVCZy+eybel1H3R547vPzt2YgkB7dhMzsYnXgDEsdgtvp9q8mVzBJrlptUbAtgc7VTO4qQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e125e27d-99fd-4a2a-a3ca-08defe342b1b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 20:55:14.9916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtPnBSpmcU5YUMIhmfNeCxJHWzru3I0txcfwKY3M/q3yb/+IGhJfUY5XmxTXeYnVzHZ1oHrgrBBxWhnd7pgG/s7qBIYfq+QFuj1GRNemzy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7942
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

On Wed, Aug 19, 2026 at 04:32:04PM -0300, Gustavo Sousa wrote:
> Gustavo Sousa <gustavo.sousa@intel.com> writes:
> 
> > Matt Roper <matthew.d.roper@intel.com> writes:
> >
> >> On Tue, Jul 21, 2026 at 03:59:55PM -0300, Gustavo Sousa wrote:
> >>> Currently debugfs_file_has_wa() uses strstr() to check if a workaround
> >>> name is present in the debugfs dump.  Using strstr() would match the
> >>> workaround name anywhere in the dump buffer and with that we risk
> >>> producing unexpected results if the checked workaround name happens to
> >>> be a substring of another workaround present in the dump.
> >>> 
> >>> Fix that by making sure we match the workaround name with the full
> >>> line from the dump.
> >>
> >> There are other parts of IGT that use regular expressions from either
> >> POSIX (regcomp / regexec) or Glib (g_regex_new / g_regex_match).  Would
> >> it be possible to use one of those here instead of opencoding a match
> >> function?
> >
> > Yeah.  That could make this function more readable and easier to extend.
> > I'll take a look at those options.
> 
> This new version of debugfs_file_has_wa() misses the fact that some
> lines will contain multiple workarounds separated by comma.  So I
> decided to implement a more robust version.  I have two versions, one
> that is still not using regular expressions and another that uses POSIX
> regcomp/regexec functions.  I have a slight preference for the former,
> but if you prefer, we can go with the latter.  IMO, both versions are
> more readable than the one currently proposed in this patch.
> 
> I would like your opinion before sending v2 of this series. :-)

It might be best to ping the IGT maintainers and see what they think.
Today IGT has a mix of open-coded string matching and two different
styles of regular expressions.  It seems like the kind of thing they may
want to set a standard direction for with new code.  I don't have much
of a personal opinion.


Matt

> 
> Note: I also created a separate commit adding a simple test for this
> function in lib/tests.
> 
> Version without regular expressions:
> 
>     | static bool is_eol(char c)
>     | {
>     |         return !c || c == '\n';
>     | }
>     | 
>     | static bool is_wa_sep(char c)
>     | {
>     |         return isspace(c) || c == ',';
>     | }
>     | 
>     | static bool debugfs_dump_has_wa(char *dump, const char *wa)
>     | {
>     |         size_t wa_len = strlen(wa);
>     | 
>     |         while (*dump) {
>     |                 /*
>     |                  * Each workaround name is indented by one tab
>     |                  * character; unindented lines are used as "section
>     |                  * names" identifying the type of workarounds that
>     |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
>     |                  * etc).
>     |                  */
>     |                 if (*dump != '\t')
>     |                         goto next_line;
>     | 
>     |                 while (!is_eol(*dump)) {
>     |                         char *other_wa;
>     | 
>     |                         while (!is_eol(*dump) && is_wa_sep(*dump))
>     |                                 dump++;
>     | 
>     |                         other_wa = dump;
>     | 
>     |                         while (!is_eol(*dump) && !is_wa_sep(*dump))
>     |                                 dump++;
>     | 
>     |                         if (wa_len == dump - other_wa &&
>     |                             !strncmp(wa, other_wa, wa_len))
>     |                                 return true;
>     |                 }
>     | 
>     |         next_line:
>     |                 while (!is_eol(*dump))
>     |                         dump++;
>     | 
>     |                 if (*dump)
>     |                         dump++;
>     |         }
>     | 
>     |         return false;
>     | }
> 
> Version with POSIX regcomp/regexec:
> 
>     | static int debugfs_dump_has_wa(char *dump, const char *wa)
>     | {
>     |         size_t wa_len;
>     |         regex_t regex;
>     |         regmatch_t match[2];
>     |         int ret;
>     | 
>     |         if (regcomp(&regex, "[ \t,]*([^ \t,]+)", REG_EXTENDED | REG_NEWLINE)) {
>     |                 igt_critical("Failed to compile regex, workaround %s will not be checked.\n",
>     |                              wa);
>     | 
>     |                 return -1;
>     |         }
>     | 
>     |         wa_len = strlen(wa);
>     |         ret = 0;
>     | 
>     |         while (*dump) {
>     |                 /*
>     |                  * Each workaround name is indented by one tab
>     |                  * character; unindented lines are used as "section
>     |                  * names" identifying the type of workarounds that
>     |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
>     |                  * etc).
>     |                  */
>     |                 if (*dump != '\t')
>     |                         goto next_line;
>     | 
>     |                 while (*dump && regexec(&regex, dump, 2, match, 0) == 0) {
>     |                         char *other_wa = dump + match[1].rm_so;
>     |                         size_t other_wa_len = match[1].rm_eo - match[1].rm_so;
>     | 
>     |                         dump += match[0].rm_eo;
>     | 
>     |                         if (wa_len == other_wa_len && !strncmp(wa, other_wa, wa_len)) {
>     |                                 ret = 1;
>     | 
>     |                                 goto done;
>     |                         }
>     |                 }
>     | 
>     |         next_line:
>     |                 while (*dump && *dump != '\n')
>     |                         dump++;
>     | 
>     |                 if (*dump)
>     |                         dump++;
>     |         }
>     | 
>     | done:
>     |         regfree(&regex);
>     | 
>     |         return ret;
>     | }
> 
> --
> Gustavo Sousa
> 
> >
> > --
> > Gustavo Sousa
> >
> >>
> >>
> >> Matt
> >>
> >>> 
> >>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >>> ---
> >>>  lib/xe/xe_wa.c | 39 ++++++++++++++++++++++++++++++++++++++-
> >>>  1 file changed, 38 insertions(+), 1 deletion(-)
> >>> 
> >>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> >>> index ff5daf529831..d44431e7e61f 100644
> >>> --- a/lib/xe/xe_wa.c
> >>> +++ b/lib/xe/xe_wa.c
> >>> @@ -13,6 +13,43 @@
> >>>  #include "xe/xe_wa.h"
> >>>  #include "xe/xe_query.h"
> >>>  
> >>> +static bool debugfs_dump_has_wa(char *dump, const char *wa)
> >>> +{
> >>> +	char *a = dump;
> >>> +
> >>> +	while (*a) {
> >>> +		const char *b = wa;
> >>> +
> >>> +		/*
> >>> +		 * Each workaround name is indented by one tab
> >>> +		 * character; unindented lines are used as "section
> >>> +		 * names" identifying the type of workarounds that
> >>> +		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
> >>> +		 * etc).
> >>> +		 */
> >>> +		if (*a++ != '\t')
> >>> +			goto next_line;
> >>> +
> >>> +		while (*a == *b && !(*a == '\0' || *a == '\n' || *b == '\0')) {
> >>> +			a++;
> >>> +			b++;
> >>> +		}
> >>> +
> >>> +		if ((*a == '\0' || *a == '\n') && *b == '\0')
> >>> +			return true;
> >>> +
> >>> +	next_line:
> >>> +		/* No match for this line, advance to the next one. */
> >>> +		while (*a != '\n' && *a != '\0')
> >>> +			a++;
> >>> +
> >>> +		if (*a == '\n')
> >>> +			a++;
> >>> +	}
> >>> +
> >>> +	return false;
> >>> +}
> >>> +
> >>>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> >>>  			       const char *debugfs_name, const char *wa)
> >>>  {
> >>> @@ -23,7 +60,7 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> >>>  
> >>>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
> >>>  	if (debugfs_dump) {
> >>> -		char *has_wa = strstr(debugfs_dump, wa);
> >>> +		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
> >>>  
> >>>  		free(debugfs_dump);
> >>>  
> >>> 
> >>> -- 
> >>> 2.55.0
> >>> 
> >>
> >> -- 
> >> Matt Roper
> >> Graphics Software Engineer
> >> Linux GPU Platform Enablement
> >> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
