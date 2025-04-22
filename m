Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0CFC369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 13:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4029A10E110;
	Tue, 22 Apr 2025 13:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3MUD/Dx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BD310E110
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745330269; x=1776866269;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=noJZ17xVD74mX/7AHIETFZUxrUJ+tjVsYZLXGTEEe5Y=;
 b=j3MUD/DxN+A7ywCLepy8aSDHysxBnwMpa7R+OAGTMujQPBJ8svWUAm90
 o1lfoF3McnJSMf483VZmeL7XMyKdSOGkIgZLjNd3HX8Uy8MbfeHhgqV99
 VroRpePCSTMu6RLSbJUL7uez7WF00Kfsoo2zPZ0KNFb1MxFoCgl6Vl66l
 Iq+k5OPPXjX0WsXhRdMQ+fc+phJSrOowDuONNgUNx4UC9O7xbUf3WQNj5
 zhM7SzghN340YtSdeOb3LHt0q5ck/nQafseMxjIuG95EclzjlX7Jv7BYp
 rysz4y/3JO44Jrfufp68syGEXz/mzsOCPAKxssNWzhYO//zVOFMndUkUk w==;
X-CSE-ConnectionGUID: ulEyjSGKQbOeX0Y+Yur3gQ==
X-CSE-MsgGUID: w+iFxK4YS2OvKAr4H7/12g==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64300515"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="64300515"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 06:57:49 -0700
X-CSE-ConnectionGUID: yiL7hzElTxmOS56IX633rQ==
X-CSE-MsgGUID: wxpoZaTMS4SFCur2d4UDOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="137177363"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 06:57:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 06:57:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 06:57:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 06:57:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ul6gm5L5w90ZXSwfYK6K1DS6UpF+WdWQKE+aRct1dO+F9yd9QZzdQ2H5AtaywV854h8BftQcYPdQnC8dkzdoRZifHi+KieLwfviGSay7iHYaY6wY1rGOTtAqdYUemLUMYv+cyXbYgYZaHZTw9T5HX1MXHbjcgnpfW4u5H4X/e+1RfajZu7YD5j7htDvZThjPu71MmuPTaUjN8RZ4GGND7/Ht2ghCBzO2mHIPp/3Ct7CT64XMm3XVnE7/MG3Y//DCPEQmzXxSs+RfoCGdlGEDk++yTU79sFfKeVtZhTZYw+mrAwVUbrNvApNTNeHQVKpQf0e6uGFzAZsxj/vWqIrC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+V+EIJ9pBzV9Q9G5GGo7z/+1pimwdmTIv3OqKW5Vgig=;
 b=OyZhVOOXzpFApboKg1ohdy0a+XDv7ck6DxEW255jhJ00slVKdebBO7y+O/2q4YTrdMPfRGd1LbTnlbKv8i7+E43TVwi3gNTlzdcuJ4xytKFRxhyifTu3hLsoDP2XEJ8LXqABKs0+/BO3WWi1GuZ1cOZsdmNG6h5VRuwUcTDQsKgrDW3OkzMTSs1EGiVXdf82zHF+SS6+L5I6aGhKIqcwTUmCy7FEkzUI68R4MinzLRjP7jChPwHqYWlfIBpbJq5tSn1wL8iMSOrSjwJAsPHkC5Qrshv5XLj+51yUEAtDAkgQV8w3nWLLKMerFiu+ZTIN4eak77UJmy7qr49VNmcaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 13:57:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Tue, 22 Apr 2025
 13:57:39 +0000
Date: Tue, 22 Apr 2025 08:57:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <kamil.konieczny@linux.intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
Message-ID: <rxwug7vusfk3npmlpvad43qhgo2rqa7jwi4wtfbhnei4f46sty@wjylvkykbjgr>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250422095602.55041-6-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abb2c00-60c4-4446-0aed-08dd81a5a4ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cqz/K8bn8riZrj2nW7mVRXnyPYreGfvuhZG5hY8QFo91v3Z2RHnICQP7RYED?=
 =?us-ascii?Q?p4ppH/+Ks656DmaJEGiIYyce5WhVQG/16JoO5dz+ul8tz26yOD2hmDBdtN0g?=
 =?us-ascii?Q?9hk+fnT1Px00ulAAP+8bf5cCiy+t3GMfDphgo86oct1gl0du58tyDNQ8pPdd?=
 =?us-ascii?Q?AjV/hj7Qz4Kt7EFgPG+KLPIEFxBBva5ZjW0dDec+iVftdMUN0ata16qQMys6?=
 =?us-ascii?Q?GybJY/cm6EZJo/Ul8bZ5XHBaa7nGm0g5RJM8mK+pJAjPMHtw9Crca19/QXmj?=
 =?us-ascii?Q?IWF8/BBx2lbRg1xtxROQxJwRQtkBjxeZhhOKLV4JF8ckhtJ1B2iM/CQ8HFn4?=
 =?us-ascii?Q?vTGYuont4W3YisXanfVcGeMIj9+SZNLlhoEvTbA1vtu6jiAh77FCuSifJ+zh?=
 =?us-ascii?Q?p6uqo/A86IBu5apZCgJW6UBV9NIfFilTZMoG79PCXXg1lp8iE3Ms9JU6faTu?=
 =?us-ascii?Q?GahLACXMuqSxqivoxmVgy8igC9b/lUGxhNnjNWkTm/540sGa+cj94gVX3zHU?=
 =?us-ascii?Q?z8GVkkWmiOiBYLbbE3JsfSlbts96sC4e5tGhK1/6hrMvoymEqmf2IL0w1ZrA?=
 =?us-ascii?Q?9FQzMR6eWsU5XVBjHFGtLS11qJ17fi0zajq0rOVGCGhvkuwM3EDdsYdlJONF?=
 =?us-ascii?Q?/saYrKQSZDCnv9qeTu3d7Af1ZTwcAxwhtUXYcIp+gvYU5k7rdKpClLsg32X/?=
 =?us-ascii?Q?fp1Gwr9zXHMB5F5rRTZGyCYf9pi+O8LBY5scRxZLQlvu3DX7w9uAp0eBPwuz?=
 =?us-ascii?Q?lCMWcz/HWoF3i26IcdlGh/Q/8Ye2XjiQDusuz6mzs6XT0fpwp+QWUm3wqjsY?=
 =?us-ascii?Q?3hZct5faKmmqZOPX1EOlWwc0x9WhoCPXPiPmsJ0P2MCj8iIcLvnTfpXWD9hr?=
 =?us-ascii?Q?jYmlv7iNV49AMTY6o3y6i9w0HsJKxhdI0uEKlig+60fE9Gw8iHfKQ64rwjtd?=
 =?us-ascii?Q?QVzPrbKlYEvpUc8K5K5dXgjkAKpW7fC0Ew2kFx98TFiC5dSTRJhJdhq6dwbZ?=
 =?us-ascii?Q?AABMSmtUbUQuV6aOEoEFjU7XjFTIk08wmwVabc0KmJNqK91O14RD0TK7Q8GK?=
 =?us-ascii?Q?54IOt3cqdKwZU+dtBcU5v013gBZmqlLhIvmEbAHBFNpcdLHuK7NSMqNzZPGg?=
 =?us-ascii?Q?1V9fs/R0/ok3iSsNEp5e0u6FOlVCnv9Wt3izbOlSjS43PDINviQeZxSXxS26?=
 =?us-ascii?Q?V90FPMqKVowkCXBOfoyqFP0LLkwPIBkTU+EinAtshJ6i+x2NhhZe2FclsGUl?=
 =?us-ascii?Q?3JKyxdkPJfi4V8Qp7r9tkvseUuy2a7ONJXqrXEgyJk+jo7W8DrBTdLxYcm/N?=
 =?us-ascii?Q?YJt4hpzMbSEmXbS63Mu+4bjRXsUuqfJMYGGxm9AHszpb62ydtVAGx+LDkzll?=
 =?us-ascii?Q?GHpw5qFWmv6BjrcW5EOAVNYXhP37Xvfk3pvXWhMYahwNiGAa3/0iLk8uO9hY?=
 =?us-ascii?Q?cdsxffhX2WabvmTuNvhzDnSrBE/j8RnQ2V067Xzuc/hcwgxv2X4UfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gGjoe00NhXYCi0qIVf3Cxh3LqOv7An65xP3NbESWWCBMdD1QawdEnOjZg3qv?=
 =?us-ascii?Q?zJCedwV8llCE/a3v3H0vcMex1EC4Kwa6FKMIJbblaxhxQocespfPGsN3NuNt?=
 =?us-ascii?Q?FidQgFEfWPRaJxKJ+mSIlqUw+jBA6B+61LWh/TH/+qjQpr9/Kc+YDw1mhwLy?=
 =?us-ascii?Q?HGoSYBL1ScpnY6tceOzrChCUq5DLvWqRQ05uGiSd1dScRHckEp8NPU/ni7IT?=
 =?us-ascii?Q?E67m3nPlIjZLg6CIfMjPYaDQxQShacD+Fhic51i4TKbwT2Vt7BRw4oHdvi9Q?=
 =?us-ascii?Q?JgcO1yPamOEkbAWdyK0RATNlLWGxFKPkLzE8bN0XjDfxNcZ9tBpe8aC/CPtv?=
 =?us-ascii?Q?1lptVcKJobxkqX8o0rgmtxlwYm7RCnDC3f41RjyYQjuyFEMbtof8/pI5FYMP?=
 =?us-ascii?Q?Q/YJgaBd5//aN3gXYuR1wGqZoPcqKC4fFQNl/MRYQWhLzvep2C5CwraGuzHX?=
 =?us-ascii?Q?3zzllDfIj1sZ/nwzVb4lJriZBWOtdDNceJX8GSXGU/xELvOaMGWtpSxneIMC?=
 =?us-ascii?Q?MzsxFK/PLVR/eqi2qc1Gp4fF9qsca4IyCr6lhq3aqEf9ekzoi6XbPak/+nGM?=
 =?us-ascii?Q?XLS0MEcW2VRduXWNJo6d8Zt9cfteOYvnPxIKzUESdIsdvJyl81rNbbjC2hlV?=
 =?us-ascii?Q?UeKzB5YnD7l04cRPpXIKfYoK6QSieuQKej4ZJAGwTjyBnurKj+b1OKzVHPwA?=
 =?us-ascii?Q?u8ai3mqDxZlWef4cUysRI1TTqRosghzFtzLvk+5FCrLXBYOf1XpRlWdlGFdn?=
 =?us-ascii?Q?Wmi9R2yGAIaANXdlB9XOXuL5opApbZXhK8hQ8drFROFfZKOaoZbGKgLkekKn?=
 =?us-ascii?Q?Ev8Z0BIspn3ljL3ptMkhiBTMogMklrEs3+PyoCK5lOuuoYPFQbzhwFU8qBrv?=
 =?us-ascii?Q?m/p1UoqGhgRkaGQda7WCMIpK47cTnGCpHKTn/ClMzJV9b3r/r846pi3yiYJm?=
 =?us-ascii?Q?xmed2/AT4AIroi8rH9By3nYpPRteqgbmOdY+lhRiVo6JC1uslLmXsVA4Wx9b?=
 =?us-ascii?Q?zbRezHphkx4wczTRZfVc2Fnm9Xkz+mo5PHH1PEAdOQZXVdDyNBQmu6IHs6Fr?=
 =?us-ascii?Q?VDW+qj73WjuXu2oUh4gwj1tHOaKnczuZYQ+iu0fy6yYoKWw+T/BzVpzCFOeV?=
 =?us-ascii?Q?HTpULnbRBG0F/dBu+PvdCIT1vHK/u9ONBfo6SoDu1y67A/fV6ybYGIn5lqGr?=
 =?us-ascii?Q?EgnPj/I6UbFT96tJzRzalCVlboHraPYX9wEpOvNbtnputKxb4mayMwW+IkDR?=
 =?us-ascii?Q?dNqqr+Sv2YCnRydlvq8zyOMnQPpYZesM6YDj50tD4C3D6deN7nXxXIlYIWXS?=
 =?us-ascii?Q?GOAHREiIx8LSyFPIAn45QkYJ69q58DEDAIjgUwkogoYBULB2O1jmn8zTbCQe?=
 =?us-ascii?Q?qJGbnMHj5wG4iBS5L5TvN7gGB+bRHmp7hk3YDw6BnG/4C+Lr24hNf0A8zMV1?=
 =?us-ascii?Q?yB6B8hXGEOORl3yxPr3HX4+zIEaVFT4NX2ULWev6QykcMjqhDonkYuYvyg2u?=
 =?us-ascii?Q?VEYYhxKvLyuKo4BCQEU7J/etetPcNB5XQV7x6ANqkSRBVHV+XnGcGZJZqL3Y?=
 =?us-ascii?Q?w2mjcjpu+nSjxel8IXUjtYmd96pO/2K02syNyCFoNJ7ajM8G9TvE1ymRKSUl?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abb2c00-60c4-4446-0aed-08dd81a5a4ba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 13:57:39.1336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nq4shykUNGX5wWho0xWhW9SKf3x8IwtZtTSwAfkJDPpfTUJX5bBQ+p5Gvu8TJexghWg1bImr/UgQLNID5wRSGO1zGvquEYNTCcAci77h8HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
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

On Tue, Apr 22, 2025 at 03:26:01PM +0530, Riana Tauro wrote:
>The test validates if survivability mode is enabled on supported
>platforms when configured using configfs attribute.
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_configfs.c | 112 ++++++++++++++++++++++++++++++++++++++
> tests/meson.build         |   1 +
> 2 files changed, 113 insertions(+)
> create mode 100644 tests/intel/xe_configfs.c
>
>diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>new file mode 100644
>index 000000000..414af4a86
>--- /dev/null
>+++ b/tests/intel/xe_configfs.c


humn... does it make sense to test survivability mode in a xe_configfs
test? configfs is just the way to trigger it. For completly different
areas of the driver I don't think we should bundle the tests into a
configfs test: we don't test if xe can be loaded without display in a
xe_param.c test, or if we can inject faults in a xe_debugfs.c test, etc.

My suggestion is to have a dedicated test for survivability in which
configfs is part of it.

Lucas De Marchi
