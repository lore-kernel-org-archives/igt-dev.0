Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C3ECF9C5F
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 19:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC45C10E05A;
	Fri, 20 Sep 2024 19:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBBP2vze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2690B10E161
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726861446; x=1758397446;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6SMZK7YctGUcbBTOVZcJyb7TsCg0VloiaweVf8JB7lE=;
 b=ZBBP2vzeAXWL20KlwtI/NLi33hYb0B1nd4PYdWW5rTrCAnc8rBlOlOQg
 ztjr264hNloLhxYvLYC8XcgYXoezFXhdsx9nYDRUrHISjXaujTsr2sgbv
 jB5e7zwCPv4csM34r+YyPLR3K4iRMWJ674Ul3i7gAxj4NOpLw2bL0WSES
 eMA6iT4QNCp+h5mhCHMxZLf9KbjYlPVCJCukXSOPvQfrZtPC964GNpNx0
 p0lgk9RRm7VZjIXUq8GHtj8fGgMgkJbDiQ3kc1ax4h6iYI/gm3YhSJrZY
 f71x1bbEKFt5jlLnXMk6TPVRp/vp3WCOn1JGb45SMg14V1z6sunnfMe/w A==;
X-CSE-ConnectionGUID: X565IbSPTbizn1Bxd667og==
X-CSE-MsgGUID: BmxL4nCIT5qrdvl1iHgr+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26031940"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="26031940"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 12:44:06 -0700
X-CSE-ConnectionGUID: FQPXefBgSC+9Dq5FXWZoow==
X-CSE-MsgGUID: vkxATFr8Rp+ou7sHYCNblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="74525464"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 12:44:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 12:44:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 12:44:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 12:44:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 12:44:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yz7st8bUkqMFo6vsPA6eEwhlxV5LGdg0Co8OZL1KvdFHPUo6TqoSUHid6PxwJoV/dZrZP1M8Ai93xiF8uiHShoz1tWcbgbGjDFY2kbtaXJAfchQmrBa63Db4XMPtDyCQQry23b2TNl4tYYgn/cJrapM2EiLb5O/5vVXTc+sqG2cFPnG5+AixdNQQp7IZi0v4FjNshshh2hdH51WYtOv1yaCcU2N7KGg/ZInCh/hzdCpI31Zu+VUByy5uUpBTeEdO+2VNdl4hd9fDNLnX41STKzRGmgvtw3LzK5lNVS3PH34w4bFqrNtTXZFYIaQKIy+h6HF0qoJ0XWupRzpdRgnjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zzw7ghKpn/YZdiU5xsI+m7iXDkYw3Ha5tmaC5qYPIaM=;
 b=mEn0pVVTVi8Zsf4Enb4pPahCVlMOQKcb7c8E5wLj7isV1ybYaToWLw1N8gQ/37Rq1g7WJ2+38kJ+iIVENI6o6UuMD5QdSguPhjqIDmex03wZhcZi2W1ukVGBOtkABsruAQJj26CnUkVAeMUMuwYctXUxM0uiodMoRuBRtAfU1QKHFMWVe7Vp8E2WIYjX18YH88wz1Siv6ihsSAlhnOGX55AY+VqrXeVnZQhLCAekNw5Ngmxq483Eo7npTs9BfIHxyk9V2/UdM0Vm+5QUqfN6Ul0hxLCyboeUxxwiqfLDkbaJIO0A24eVNnLlNDrWwZpAH8DMDv+D5u/NPnCG0RjUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26; Fri, 20 Sep
 2024 19:44:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Fri, 20 Sep 2024
 19:44:01 +0000
Date: Fri, 20 Sep 2024 14:43:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/6] tools/intel_reg: Add forcewake support to xe
Message-ID: <g4uquvoopv2fma6jfzgius2g7m4te2tuaajrbjkqlv7hpgcxvi@nsioq5n6hc3g>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-7-lucas.demarchi@intel.com>
 <20240920180135.GR5774@mdroper-desk1.amr.corp.intel.com>
 <20240920180420.GS5774@mdroper-desk1.amr.corp.intel.com>
 <Zu2_REdBq8HzQrk0@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zu2_REdBq8HzQrk0@intel.com>
X-ClientProxiedBy: MW4PR04CA0165.namprd04.prod.outlook.com
 (2603:10b6:303:85::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: c42a299f-a73a-4a59-7cdb-08dcd9ac938d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6au9sxI/agJHceocwWQWP7YExoVxVxpst/a6EwAvA26XtmarzLMN2SZsa6?=
 =?iso-8859-1?Q?zuehSvQtQqYeBsjKZU0HxpQMb2NhqRlIS2WJeLhkdYymgSsb5lloc5OUfX?=
 =?iso-8859-1?Q?2+BApVZgAi2tTfYzXm5Wpwdv94FjgHnxeD3VqfiapGDYn6dQNRzUXseU4M?=
 =?iso-8859-1?Q?zk4+Z072AmCQvUv3ylNM0gZx3OEB3+dDcm4IxobOLmgjUe0kWPTqwKkB+8?=
 =?iso-8859-1?Q?TBKnibALzME7E+JbqFsImqoI7yT0evQRLXZgjes052gsGG7abNiJFg+MZh?=
 =?iso-8859-1?Q?iXd91/VHJAHNuFlLF0VbjGKIWllecsvwbX7vIUHJ0fRsg+TGjRpP530RjU?=
 =?iso-8859-1?Q?j82wsDeoTQVI9wTK1gFO4RD7SiJwEPx+IKwvNJVOWE7l58qbg9dENTyx/q?=
 =?iso-8859-1?Q?wHQLk6T2uB9IIob8BJtRfT7u/bSCSuqz2SgTamhfcBEnsAKOdxIaU7tCbE?=
 =?iso-8859-1?Q?LWRpAHGg50jZ6DReyoc4mRqXMXp3e9EW9CfzaXnyGDl0FwDQ6ZKwn+6Ul7?=
 =?iso-8859-1?Q?CDXIAuqxcx8Ae/05TCd15miVUgfC8SJZYXAK5N6wunhow+WFLo6DZBPgMl?=
 =?iso-8859-1?Q?LbvRzDaxVTaM878Wx6W67islgRj4jz059PuDoiTmX7mL5BD02fWKuqWivN?=
 =?iso-8859-1?Q?7hb0H30JsoPa2cLpTIJ5BsaPbujR4SgmiJmeOMap2MhXzBG4BAfZW4U5l2?=
 =?iso-8859-1?Q?402TCkSo+CQLOK0ug0uPfwWKrNadY3l8zPxbOQoPjG0+49IVYiqVbAzaKd?=
 =?iso-8859-1?Q?KByvKXH6uhUkhkmv90+3KUuavTUNTPXoxu4S6IMVEMIF07v7B+7vAtSB+S?=
 =?iso-8859-1?Q?m63iJbmEvZ6QOULL6lbjjsbs88WOxnY1fr0VUqS/GIUKY3GU8OkrkZvrAb?=
 =?iso-8859-1?Q?+J0a0Q7HgY6nd6+ritRjN7rAWk79T+63xNahcgJcmDt9cvgbs1O882zDc5?=
 =?iso-8859-1?Q?OHnix/TnYTCZOetDI/ObRo7mgFYmRAcO+PqxYLfwe7PU8vRajr7fQBPOVB?=
 =?iso-8859-1?Q?GLEfTZZQSuoCfM9R8q4i1IP/dXosgDBAAimUxAnQXRvgKBb64LHY+tRDZQ?=
 =?iso-8859-1?Q?o5M2rljO/qfrbPA0Jmu0Z/7aE1XXNSsLJ6nEIMmPwN5M1fDl0Jd2P9zAkH?=
 =?iso-8859-1?Q?IBHBkeXt2BECdg/wGkV/bEmjcRVZcj3sS3Er+JeRzj3Haj/ttpvy6X0bYt?=
 =?iso-8859-1?Q?tC05yPMk1QS3Gq7Hx9tKHwBsg7Zf2VcZxqZXw47Nt5ISJaR/dKnUIFwT4L?=
 =?iso-8859-1?Q?ylKYvFCTFv90ay7gzrCpPXkBd5qPva007Igkw3kFGdHZZ9yaJ+jHAHoZyi?=
 =?iso-8859-1?Q?Z3poNn8xJ8ZK0HwHRNJBweSrzqd/P4KYABTR0+ulgBPVoKUkrKR2cw0sVW?=
 =?iso-8859-1?Q?cid0bs7bQCblkrTCtNL4/kpK8JtHL1zA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?W51G323u6+gGDAJchyPOj8BQ1ICDkiXPLLq7kpArPOzHXP1X1oPY3xxkY4?=
 =?iso-8859-1?Q?fQQ3XRoXWd8u/nxzQ2n87zo0lale4VGbm4wmORlxpciLaPQSVcrJ9noIkO?=
 =?iso-8859-1?Q?ZrhWDt7aCN5/F7PnoI6FDfShuRcfHzwD1FH1hJ3wqSx8ZLRJjQuwTMF+Kx?=
 =?iso-8859-1?Q?zbVMyLORVHkBDwxD75O1MfQ3ZbuPA3sM272YB9f9rXutBoCc0iArhluRS+?=
 =?iso-8859-1?Q?8E+syPZWGphzvAsGys2zQ574y6Pc2fFKI79anzf42kvnT0JpZvyf+NFJVG?=
 =?iso-8859-1?Q?Infhp7OAd4TJ6X/3PYkiSUzNdi4Euu9o4/94aB2uDr8+/yuINf/PhRIrSZ?=
 =?iso-8859-1?Q?VUyYEmKvy6892O/WkxE02OYCPL2a0uHjSDu33GMAE5pT/6UEjgRPf7gD5W?=
 =?iso-8859-1?Q?l21m6a/CKswMTNMGWzLyaIwN5JfquPv1L1vTYi0RNDAZ/MQoPDZBP7SAoy?=
 =?iso-8859-1?Q?4qt4L+uZ+o9ylAQ6lmyVzytC/Rf/nTvOEKGXoQZ3wuVZ6i6te70c0E0NT9?=
 =?iso-8859-1?Q?bZazf0K/AEurx07eMq5rdjT1FdJCF6UmHFXZIA3NreOtIanPIWx8k+b/YE?=
 =?iso-8859-1?Q?53yqXfe0SoXAGThA4bvdgi+OtvuIF7RzmcDPUtzS6HowDW/4HXsXbzFR+J?=
 =?iso-8859-1?Q?xDTye6f3Kt/qW2OooAUkGSsSUFM69mnWuXjHrV4GzpY/rXt0klMoysKAK6?=
 =?iso-8859-1?Q?MLwE8zRxCUCM1JkXjF1ueTkoSPKd41kgjwQ2bZmSZzi5b419aZtGAv5tSV?=
 =?iso-8859-1?Q?JfIoLzR9GyGefksYNLSEGdNcNHIpJ5Njf9ZvGp83yUSWmJKccrX6m5EU0k?=
 =?iso-8859-1?Q?jaZLRcESSF2fDPkV/RMLjJEOKtiadfzbLbh3FANNA0kMnM+i+SXSYNV3oN?=
 =?iso-8859-1?Q?+6q+BD+IGHgXlN8urrWNjTIz3b5i0uCIsTvvBxZdnNfLBJ9eFoIG4zSiDN?=
 =?iso-8859-1?Q?kVaOjpbZomC/lAP5wR5Z216PBhkk8bj6JUgAgFS9gPbDEblZU5ir/KrLxn?=
 =?iso-8859-1?Q?6mdcCu7ef0yYEphrvpQG8j9W1oaRBgs4Ds09FUVhb1LVX+wBvu63SDfoQY?=
 =?iso-8859-1?Q?0ttEwlxb2jJhoVbBcjX3krdYSqhpQE0wId0jbyNXiZwWbbp+YfftagSCEw?=
 =?iso-8859-1?Q?DeWZXGGNu+1LeiHlTwk9FTVBGNWUKrgZm7jgqOPvxUVPdoxFv4TtGbUbGR?=
 =?iso-8859-1?Q?V+ZvKY+kkijczRAn0KV1Z8iN2SGDcat3SOEX3qNHXPEoDod6JI22nUQReV?=
 =?iso-8859-1?Q?/7/Re8xmEazHqAU5V8pZ/tzHxhR4dE7I3sj/1CztD8tyyraTaOSEGgIIew?=
 =?iso-8859-1?Q?irL4Wlc3HcgvPdqkgkpmo4dhUeK04PIvPsyPdWZBTE25ftzgrYJVNMpQ+d?=
 =?iso-8859-1?Q?Miu11iR4ybyWfmR4fWdOLPdy0GEduh9UZx/z1GG7dkj9ShqXVUskKpnZbl?=
 =?iso-8859-1?Q?sqonuB9lQLv2jN9qCZwb46uU0DfOgaEcEpsOtgGoHmHyXBgMio2kYcdUAG?=
 =?iso-8859-1?Q?1MjEhbgPzHx11ZkRn1b4kW/7ssC/GLTphVbI1nnNIb/fzGnYKnCSTBoYMz?=
 =?iso-8859-1?Q?kX/Vp9C+71afPD/xOrXOfQkT287uRREzY1w+M1B8khAJ1PPnUry4u7S7su?=
 =?iso-8859-1?Q?ryR0RF8YP8rqaTCzjo2y5dyzaHqQansiPoFFNrgGCGT/zuLqpggNPsQg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c42a299f-a73a-4a59-7cdb-08dcd9ac938d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 19:44:01.4595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MlJ4ylP/nl9G/zEeAkMhgmLAO83vMquCC1B87KvMmBi8Ked+YuQ4AETSEwTHW53YaMcwqmsGB6UVVpYOF7pDtj4PoraK6v8pOtH7wN7Mhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
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

On Fri, Sep 20, 2024 at 09:30:28PM GMT, Ville Syrjälä wrote:
>On Fri, Sep 20, 2024 at 11:04:20AM -0700, Matt Roper wrote:
>> On Fri, Sep 20, 2024 at 11:01:37AM -0700, Matt Roper wrote:
>> > On Wed, Sep 18, 2024 at 09:36:29AM -0700, Lucas De Marchi wrote:
>> > > Now that the igt lib is prepared, start passing the open driver fd so
>> > > the correct forcewake is taken.
>> > >
>> > > Before:
>> > > $ sudo ./build/tools/intel_reg read 0x2358
>> > >                                     (0x00002358): 0xffffffff
>> >
>> > Hmm, this example makes me wonder if we actually should have called this
>> > top-level "forcewake_all" debugfs node something else.  This example
>> > shows that we're not relying on this interface solely for forcewake
>> > purposes, but as a wider "wake everything up and make sure it's
>> > accessible" interface.  At the hardware level, forcewake deals only with
>> > the GT-specific ability to exit+suppress RC6; if we read GT registers
>> > while in RC6, we'll get back 0x0 as a result (which isn't what we see
>> > here).
>> >
>> > The failures we had here were because the device itself had gone into
>> > runtime D3 (so register reads come back as ~0); using forcewake
>> > indirectly suppresses runtime D3 as a side effect.  But if you'd wanted
>> > to read a non-GT register (sgunit, display, etc.), those register reads
>> > also would have failed before this change due to D3, even though the
>> > registers themselves don't need forcewake.  So we're in a situation
>> > where we also rely on the "forcewake" interface for reading/writing
>> > non-GT registers that don't care about forcewake.
>> >
>> > If a future platform adds, for example, a new sleep + wakelock system to
>> > part of the sgunit, do we want to make this debugfs automatically wake
>> > the sgunit too in case we want to read its registers?  For that matter,
>> > should this device-level "wake up everything so we can read registers"
>> > interface also be grabbing all of our display power wells by default?
>> >
>> > Anyway, I'm probably overthinking this; we don't need to worry about it
>> > for this patch series.
>> >
>> > >
>> > > After:
>> > > $ sudo ./build/tools/intel_reg read 0x2358
>> > > Opened device: /dev/dri/card0
>> > >                                     (0x00002358): 0x91e59eeb
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  tools/intel_reg.c | 13 ++++++++++++-
>> > >  1 file changed, 12 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/tools/intel_reg.c b/tools/intel_reg.c
>> > > index 906ae9b84..b650c3697 100644
>> > > --- a/tools/intel_reg.c
>> > > +++ b/tools/intel_reg.c
>> > > @@ -802,7 +802,18 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
>> > >
>> > >  static int register_access_init(struct config *config)
>> > >  {
>> > > -	return intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
>> > > +	int drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
>> > > +	int ret;
>> > > +
>> > > +	if (drm_fd < 0) {
>> > > +		fprintf(stderr, "could not open i915 or xe device\n");
>> > > +		return EXIT_FAILURE;
>> > > +	}
>> > > +
>> > > +	ret = intel_register_access_init(&config->mmio_data, config->pci_dev, 0, drm_fd);
>> > > +	close(drm_fd);
>> > > +
>> > > +	return ret;
>> >
>> > As noted on the previous patch, if we get here, it's always a 'return 0'
>> > since intel_register_access_init() can't fail (and should probably have
>> > just been a void function).  But not a blocker.
>> >
>> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>
>> Actually I just saw Ville's reply and it's a good point that this tool
>> did used to be able to run before/without the driver loaded.  So we
>> should just skip the "wake stuff up" part and proceed without failing
>> for that case.

humn, but the current state is the worst possible one: it works
differently with and without. I was thinking the case of working without
a driver would be with a different backend.

>
>I've also been mildly tempted to make IGT_NO_FORCEWAKE=1
>the default because it's annoying when I sometimes forget
>to set it and then I might no longer be doing just the
>register access I though I was doing. But that might
>be a bit surprising to folks wanting to read GT
>registers/etc. I suppose a sensible middle ground would
>be to disable the forcewake stuff by defaut only in
>the display specific tools, leaving it on for the likes
>of intel_reg and anything gt specific.

maybe off by default and add --forcewake that would require the driver
to be loaded?

Lucas De Marchi

>
>-- 
>Ville Syrjälä
>Intel
