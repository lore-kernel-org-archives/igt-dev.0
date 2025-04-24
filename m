Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B6C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 04:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638DB10E3A5;
	Thu, 24 Apr 2025 04:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgdOsGe8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526F610E3A5
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 04:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745468272; x=1777004272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EsL15LXS9z0U0+fo5PrpWmxgU1siReiHpwMSr73PsUY=;
 b=NgdOsGe8Go7vNT6sAbAzBuq0HLFrGy1IMa1zJtwfYqS7TGqslhujcez1
 S0hJT/1QGLV2ugba0up/sYn8CpfpQOMBCX+dYP1ItbVhj7NSAnIoG2D0k
 KDBbYaRroYOozGNwy0s52Kqw3FVbGLuu7tgZTzpy+WkhJT1nr1pgtcxgg
 t6ZnqMW0tcNkhXxqYVemOii5/0gS1VHexvBCY2QdcVrdBu9TgjEaTsH0n
 b+FvzuK2pGvsRNVpbNJWDAceLS8T4UJ0uF3ZBsFvYVnGOgkW8tYSnJGII
 LXlWWBAWwHhC3+WbGhi7tyCsQ3PdPaI3zsOvedJVIxxPkyK0DRDTt7OCV Q==;
X-CSE-ConnectionGUID: FS/If0B5QTqQW+JzOW0B4w==
X-CSE-MsgGUID: the61gMVQcu2y2bX/umMgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="34696771"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="34696771"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 21:17:49 -0700
X-CSE-ConnectionGUID: A/rZo+OKSoyyiK9mvf1z3A==
X-CSE-MsgGUID: xlzMvrhsTiWXhXVHiWfH7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132234039"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 21:17:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 21:17:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 21:17:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 21:17:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHoBa830ZwidpfuHXDD92i7ErGk6I5Y2vcD1opTDWyAnkj3ouphf4ErndX8V0vIA5a8ci9CsqEJ8WCYdUn4UHnpaMSj6aKmCjmgE9rWWVhW6qi/2DWN13jWIDvC9Wqvi9dZMJiefjF1AiH9ve8U0LbMwXQxSUXtRZ9/5ocvNUpmPEIQqYtKpPhxQMLrsYvtwAqHhC5twov5//l/YQgvU3brAWR/NrO0kJ+cNvK2xiefxwQQeTcMflSitkP/dEu2rst0rkqG/hEJr1fwf8/VgDzzUstvYEXeyOWhgCcPkemUGoeo75AkGHFMH9v4HBGXVJ6XBLH06MktspJBlHt/q4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4aW3Kr6wOvDpexZodbOaCbCcviSGJ6Ylim5wH+OnhU=;
 b=S1E+tysu4a9U4KcUeE7lIRtUfeClOhVd4Fwsx5bVTiRjwGlkc3u/mr6iUiNcN9rKnfln/fj+Lw47OkDT3cQeL+PkNjh6dT1ymJ0b1HyjyST3iPKlRbOADhfqiNGHVAHNFc9Nf1MaEta8+xN9esUAge0Krm1tc2dqXoHeIsEEUAUdtuPS6fyl8UKmAlgYdiEZmt95hd/V8WY/vHZSu76U8wvBJ3IEEi7kxi2Z88KwFyj/gqAT8GtUUnQ4igDiFiNSMCpZftGvw50009cPfJ67Gfw0ewLqSsEP8xKj+AnY3n4acL7XcfIAOTcXycOElt909u4rcn+cCMyxABe1sDyibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 04:17:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 04:17:39 +0000
Date: Wed, 23 Apr 2025 23:17:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <kamil.konieczny@linux.intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
Message-ID: <md6mljnmwsujfhv3up22l6rqhlmfyhg4qicqonkhfetabsako6@z5drpnypwqyr>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-6-riana.tauro@intel.com>
 <rxwug7vusfk3npmlpvad43qhgo2rqa7jwi4wtfbhnei4f46sty@wjylvkykbjgr>
 <aAfuM25ln-ugZd_W@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aAfuM25ln-ugZd_W@intel.com>
X-ClientProxiedBy: MW2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:907::15)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0f7577-a1b9-413f-e556-08dd82e6f331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TJsKCMmHzuJwhwnc0LVxo82z+Vp1Xge6aSmH7VFuO9l8pxYPgDQJkZc6DnTp?=
 =?us-ascii?Q?nF3rL2Wu+DXA2XLnGULQ+xhLDIQ4e5SYN32sYOKRQ5hJV7Zg7HT0PRN/r8s2?=
 =?us-ascii?Q?dAFbiLVaAZIpfqzxvfPvtDSS/bLyjC9BBTjSo6MOzoNFaY6LYp+X8/EGU/x2?=
 =?us-ascii?Q?578FfRsYLenDmvXCqrf+JP4s95rHpNj7DZGt5hADvkfzSZLDAIuDyl2cTk54?=
 =?us-ascii?Q?qRQVkR2DjcaV7TOvyWJo1CJXLprj/Tq5RR+HtSJSGLk3/evxS1B4xq7WQDBU?=
 =?us-ascii?Q?1DoVtaLt9qsEnB8cC9KeK3AC3joFk2z0GeTo9YjwwAOkzuLyJTcDAnYMD53d?=
 =?us-ascii?Q?mEW+PGz7qiKBFWmQal/rgoBq4+jQ+YjfGsNS1fHQzOwwLiZizGI5kouPT02/?=
 =?us-ascii?Q?Yvuh1K2cThZst+mgaL3IAvf3GcFF6jo6XMiOlNA7lOy2a0Iyok338rwXErzD?=
 =?us-ascii?Q?YU9RYpANfOgZ0dcavn5qwmGxEcf6qchp5attJYK+pTsZG+Zdea9T0xHSMCqb?=
 =?us-ascii?Q?Fd6C/iI7HrfD4EYrdoNV5Kmy8sX5fpTDeOcfbQVDOaxYLhgKDog5flmGdJQd?=
 =?us-ascii?Q?Sc2tzxz4mvhTT7wzFAZrek+pWja9WNskD8nqXCqoUHpboa8NQRnGtGU6k+R8?=
 =?us-ascii?Q?ulZMVeAO5D5zlJyoqWqID4yD/enPpDzehzW/fayVEGOhJmGyo5ypExfW0yCL?=
 =?us-ascii?Q?GOrzz/FbYgUzu/jNEvxibkU2Krt5BopQELMFBd7WiGjke+9GeM93l/i2cdu5?=
 =?us-ascii?Q?35hSFlfFMQc7G/a9vFEwiZKymvF4dUEAIf7CzgRQNBf3kV77muRpziKhc4I6?=
 =?us-ascii?Q?5FP5qnc3UpBqq8Hz+Y5IZ9TF6ZiHAXrEk0jzjTco8uqAy/1l6TEO08HSOTQ/?=
 =?us-ascii?Q?OJGjaitjAFdmMuOinjU50j4whxNNKnLHWbQZ2H+Lj79fYC4GNzvnbjw5hGAZ?=
 =?us-ascii?Q?nZn/RMq0GEGKuzfFT5Tus4IPDxpM8wDblGBWGX91KTDO8uliZbbxO8pdgVhX?=
 =?us-ascii?Q?kN27Ln8e9zoiRBADHybXMk2U+7e9GO5+a6bmdXfXXld2FKB6/rRbg7r14RLz?=
 =?us-ascii?Q?NAm1whEspgHkWXgY0e7Gk0VwS78VYEvw88YPW5r0mpe7UioHt926QntypUAW?=
 =?us-ascii?Q?6axrAcIGf/m01XlJqx8Pk+JJi8dMBaNh5yWRJEFgW5B7Gu1hzeGcPyYo43BC?=
 =?us-ascii?Q?FGEJ5pqI10EtMjYbKPOEQfyCxLgHHjG8YRavARQY6k12L1ZMUtfuQFXvoib9?=
 =?us-ascii?Q?id25o+qgaxPOeTeaqNrDuxydkD2O7S/m6l6hfhwHT3iMXl3HY0rPsF3u/M7Q?=
 =?us-ascii?Q?SCaCpqJYQu/J6S2PLrJX6z63eHNEleCoC0YyS4GgmZWaSE8LDg1tCpErGu32?=
 =?us-ascii?Q?mniZyjKS0muo2FfafjQOwDswoC5AhOFkkfZ3p11Mesdm6u1o8k3S6mFJjZZe?=
 =?us-ascii?Q?Z4zHa3TKHMA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lk6PFPqypEd4ffHcBRL7Qm7ZGMSCghR/kLL/2O4hDaB3jw/08wO7+4QxN+Nw?=
 =?us-ascii?Q?7ibHSzhxurpN7gQ0TiLNhs+0tcdjPbirtOY6b/MM4TznAbda4TC6aTia0Uig?=
 =?us-ascii?Q?IG8isGZVsZavKbiRdFNQ7bwlgkYnjI99cz2N2PD6BsdF3WDqDVbDWSRceeb1?=
 =?us-ascii?Q?LFottlpMDGufG7YUftZ6miLCRKKmin3oqkoM+NBc9ZdLyRVlI/TsKOCIiu3l?=
 =?us-ascii?Q?CoRMIxLhdQ7GUPEQ7j+bOeXNG41JoCDcD/Xl1CR3PavSn8xNcQRMddconHj8?=
 =?us-ascii?Q?jBvWVDYpMXwsgvlyZFTkMtuaiXE5RsBuzV1XBZF0XBFcvKyaEMqBtSj80Ty+?=
 =?us-ascii?Q?OzyNOYEJ8PpSZbBVlM63q4lVYzjR3+O52t21kHLsSuudJgLrmPzKI1HZwTKU?=
 =?us-ascii?Q?fvNM03mXn6h+brHGecIEBNaIVNLNOyD2lxrPSPicD7VP687KdcoR2rTFGOQS?=
 =?us-ascii?Q?6yNsqjJQsnes/z/CKoFfp2s9zHzMB2wvSNwBSSrZIxWG97GdEiM3DHmtc/vZ?=
 =?us-ascii?Q?xew66fMBTeGKcxib9sQHOa71AEJi5hsAxk9LoDzhi2h/Y1cc3lTTw1R7w3Mg?=
 =?us-ascii?Q?3tO4jepn3VhgQUI8C43/+TRQbV/s9IvxOLBwD3li4WiN5WnjZBvWKKOmPL/e?=
 =?us-ascii?Q?aBWrs3iBAl7XMVi2rkQqjsP2xCDECOnUvGTl+JzNMXItj2hSq1lN7Z/hV1Ap?=
 =?us-ascii?Q?qvf1JN5QXlzVPEZFarZ+oiBksbwu+W+hH8/epoKLa7KjbQK93e7ndyhN7bs6?=
 =?us-ascii?Q?da3XK2/MF/J1C9VMgUFihbOCob3WPz8dwiup1Ekz/cBiyqgjX8hzvXRWLexX?=
 =?us-ascii?Q?YShkiqM0Lpx0+qV4GhFgcmqtgvCsLL8XW6dhcR5uJYQkTMCKvhaMQZZVeEBW?=
 =?us-ascii?Q?6TY0oMY6pe45pce0+D9qdRenTDZBoAT4mhhXkR3Z+NMliEmeDdAJqDpBF4U6?=
 =?us-ascii?Q?W/EqUD5cIn1w6UxBHHc9sTEbiBsPsHgv1UiA5cdC/T8iSQriDdXIIhL9R1zy?=
 =?us-ascii?Q?ZQrHZY+M8mZ4J3esfc6o2ugObGQiDFpD6/FFIpVg38pdzvoztSptZHDqwiRo?=
 =?us-ascii?Q?FvQcD7XADa1a3mc9bMq129I4Gb6KeqB7zU/raIUma9lHhYIRTeWwT1fmItfO?=
 =?us-ascii?Q?fpDpoBZmIg9Sij5w3+9RMuakMmvJeSsoen/0oYTCBv9PyPkojhrdrO5Cx8J1?=
 =?us-ascii?Q?gMOy0S+q7n0NIl1XwZ9XQ+RMgZ9dEHKfRT4zGEmkpY2kCYpIi+D8dM3ASrZY?=
 =?us-ascii?Q?w4A5qOQTrFwpX3u2/+Qqj6FiiJhvmLwVak1nA1qWnfCwn/AfPe0weW2fx/T9?=
 =?us-ascii?Q?6nRGlVV1HDgaMDRbLqXnG9ON0DoUrO8E9CALKEz3qV+vqQawoaeay+oe0gkC?=
 =?us-ascii?Q?/Vnxpujx9hyhxQwqyxX+eJ12gG39o7Z/YcABPRg2tXXYYovhxjVqjx3kr5Nx?=
 =?us-ascii?Q?r1hCKjqOKqQjPGnqg3tEbHtofFP7xHlf2OrOPTON9jsFPxudKwZ0vkEUxOcD?=
 =?us-ascii?Q?STi5MVunnHDI+8GoisVqY3nvAC9VTSntO+lr1mWfQRPDkpPik9y5q6rBxcdc?=
 =?us-ascii?Q?v7CLhLMZHXmNiXp6KkeZfZQiKdzYzB/oyZGhkDLPCZo/3MrFfhImI9+aC/k5?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0f7577-a1b9-413f-e556-08dd82e6f331
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 04:17:39.2393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CweXf23fP17cNUusXttuGrtyjVPsBsQjeb9YOc/WeNH620qJ5kCAHyr9xTtB3DDGAuezhqxgmEuyiPbqnGc5LfSHN24FDivcZNIqXfXujg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
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

On Tue, Apr 22, 2025 at 03:29:55PM -0400, Rodrigo Vivi wrote:
>On Tue, Apr 22, 2025 at 08:57:35AM -0500, Lucas De Marchi wrote:
>> On Tue, Apr 22, 2025 at 03:26:01PM +0530, Riana Tauro wrote:
>> > The test validates if survivability mode is enabled on supported
>> > platforms when configured using configfs attribute.
>> >
>> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> > ---
>> > tests/intel/xe_configfs.c | 112 ++++++++++++++++++++++++++++++++++++++
>> > tests/meson.build         |   1 +
>> > 2 files changed, 113 insertions(+)
>> > create mode 100644 tests/intel/xe_configfs.c
>> >
>> > diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> > new file mode 100644
>> > index 000000000..414af4a86
>> > --- /dev/null
>> > +++ b/tests/intel/xe_configfs.c
>>
>>
>> humn... does it make sense to test survivability mode in a xe_configfs
>> test? configfs is just the way to trigger it. For completly different
>> areas of the driver I don't think we should bundle the tests into a
>> configfs test: we don't test if xe can be loaded without display in a
>> xe_param.c test, or if we can inject faults in a xe_debugfs.c test, etc.
>>
>> My suggestion is to have a dedicated test for survivability in which
>> configfs is part of it.
>
>Well, that would work for survivability itself. But perhaps it is good
>to have dedicated entry points for the knobs we expose, like we have
>a single place to toggle all sysfs and debufs. So we don't forget to
>add new cases and we have a single entry point to quickly exercises
>the knobs.

humn... dunno. The problem I see here is that the answer for "does it it
work?" is quite different for each configfs file we implement. Some may
even be honored on probe only vs others that can be set in runtime. If
we had a generic way to test the configfs like:

1) write XYZ to file
2) read file
3) make sure it's XYZ

then it'd make sense. But for these tests, checking that is not testing
much.

For survivability we should test:

	1) bind the module in survivability mode
	2) read something to make sure it is in that mode
	3) flash the same firmware... possible?
	4) unbind the module and remove configfs
	5) bind the module

For possible other things coming to configfs:

A) Extra Workarounds

	1) write a {gt/engine/lrc} regiter-save-restore
	2) bind the module
	3) check for each of them, via <debugfs>/register-save-restore that 
	   the value is correctly set.
	4) repeat test for write types like rmw, write, set bit, etc

B) Fuse off engines in software

	1) write a file with the possible possible engines that we should export
	2) bind the module
	3) check via debugfs that the exposed are at the most those

C) Do not attempt enabling display (i.e. a substitute to the module
param)

... etc

Are we going to shove all of them in a xe_configfs test even if the
tests are totally different? I think it will be harder to maintain, but
we can always move to something else later if it becomes overwhelming.
So.. I'm not sure. Any additional thoughts?

Lucas De Marchi

>
>>
>> Lucas De Marchi
