Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC36C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 18:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4322010E2EB;
	Wed, 21 Aug 2024 18:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IU2gQnKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3F910E2EB
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 18:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724264268; x=1755800268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W1h1ohBK0Uo8wct18Dy//yvQ2i+Bpp5sg9Rz/VcSQCc=;
 b=IU2gQnKiwgzpAdRoWLCNhq20pQP7tMYvrGmOr1vEjwFuX07h07uG2/nr
 oLHNPt9OCxYEIgeVJK9a1xYQDOLZTpQTltg8m7W8uZuU44or7OEaj1wgL
 m2X/WJsn3/bKHBt8UrbTIma6q+ieOgzVIoJGkk4g9IT0GAHemLtsXtV1D
 7fcRnQ31caV67HlsI7zcpvf6ASEySYhLC9eDtLy3VyugBePIIVngdfZts
 aqgtEDITJaArVPAm+ef99OmiThJY6oyy20yNB5DmH1AyY0qxGAhklXBXL
 Ovq9fXvWFjk82QKtehGwh3jTZxWcH6ij2WlbvpdvA8WYUjveeup8oXaMC A==;
X-CSE-ConnectionGUID: muwSqlHPS6+Xc9A8XhMRmg==
X-CSE-MsgGUID: qIJz+7ZnRq+HR2lbhiy/Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33259174"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33259174"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 11:17:48 -0700
X-CSE-ConnectionGUID: CKuANA4fRN+1SSXFsjbL7Q==
X-CSE-MsgGUID: pQNOMLO4SXO8vIA/zpgE/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="84342054"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 11:17:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 11:17:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 11:17:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 11:17:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 11:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+DcccgJzzgEkw9NRVoaBfGYXc3gc2OMUrHatzvjcMTERO8SS+T48225g8pHexiYJbOEEZU76rbS77/Gj+genlgdNcAXim0vdJxBZqx1whsuCJT5Qdm7/o821Rim4als92Y//SLpGv4cgTBD0KtbJSHRCp+wMb+dVo/yHCJGHw2UZTVZPjmoZBiNt4q4aHXnmTKaEj0el4nO+Zb3D/DsA26OEmeYANi0Ed5qfx+mqNADqeoYwMkJ9NwnjnG2WWzFG3pzXcC9OB5LQPj5cMVizLu6ZhCyNL0oxtrQQI5ncnApCsztd+O8C3o0KGmnXRAyf2qjj54fICExpsTjWTdpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67RQ17jOHmCYznV0ou5uNLSQhWJDr2GQIueusEcrKFI=;
 b=PPlbI8GFvThGkUZ4y/6+Slz38pM9KbxrQzAjmmgB3GxYHFMElCQCwWdY6hQmNBkriC/PFZAdYEMHxSIubDMgcLIJidIY5/TOq9X7l6tXpwEtWuals3gx4vq0iAGPGnOp6fPBhKdQD/TweUSwc0l8hVAvsKL/p4ezUOSygOESv6A+B9yz/wCoT8RVkN6dA1Cl/oqMLTwIT/PQN1cgtok6om0sYGHFMTx8Laoq6IiKvP8MXSFcsjCpp/HNLUttnM+MpWMHqGtvX1RzBNb4ZWkntqnOUI8t215bGNyS8G3qx/lDQYuNaUwiOeso+4seGD19d6SOUAJLbnuS7VZzBKe2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 18:17:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 18:17:44 +0000
Date: Wed, 21 Aug 2024 13:17:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 3/6] tools/intel-gfx-fw-info: Embed fw decoding
Message-ID: <fg73d7satdts6b5onytfvv6k2gdofzg2jrjeqdnckiw337ifgw@lkvqgrdeeppe>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-4-lucas.demarchi@intel.com>
 <172425999049.2071.14378625283004611085@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172425999049.2071.14378625283004611085@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:303:8c::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 9255ff89-2ee2-4547-7c69-08dcc20d8d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gXavGA8ZAe5uXmLaaNvNxido3sA/ozFtHmyIDN0Q6MBHvkTU1qmh5/+fyEdk?=
 =?us-ascii?Q?ImqLeYysNA8gYv7rJ/IcP9T6PzcICCAefg9I9xw3PSWhnE3ER78wN3V5ymRK?=
 =?us-ascii?Q?jHNazol4L37wmOEyPgX3h97+uIwpLZOE3TzU+MwY/zYXJD5PknIrLlBukjj+?=
 =?us-ascii?Q?4b98lnTmC7rOG1lCswnJP1lk7ds0eg6ltenJ9KuTLlnPenKtiJIs5T03A2gn?=
 =?us-ascii?Q?pNEEwTUfRRgUs0hTopuz6Zs211wUVtroLJ2SUwjukEY3l5OsZ81AC4k/erjL?=
 =?us-ascii?Q?pDbR8zn/RA0w3FroM7Nu0u+hmUMRFSCwrlocsgTF+4NGztgxPtS1Ndos01wp?=
 =?us-ascii?Q?0NOpthQEScxGMTCneFlnH4KYyfY/Q+SVCDIPBZIMpm+2duTVNPxIzbdCMmMX?=
 =?us-ascii?Q?a9zpnrB4dtpLsDheu1mkANR6zKlrOiYlikP5FToBI0BMaX/FAD4RH/nlLQVx?=
 =?us-ascii?Q?1qFEjPBvwePgPJDjYXkf9su64CCvHOQ2aQYpUrvE7q87UcoXQ1ywe/OHTYKl?=
 =?us-ascii?Q?HW1OuKEip6Gs+QooP4D85MxlbEvHD8gCEuK4nmxUPnzi4pC3ebBp9JQS/Sug?=
 =?us-ascii?Q?lyXJPj4c7GPuEubPV+QOxltWK6PtH+D3bTu+WbWSPd0YXybNBFjcklxECoWM?=
 =?us-ascii?Q?28+/m1T///cR6pJY1CFcDtPigH51Fgqa1zmI27urFjEorCP8D+CEsVdugqZP?=
 =?us-ascii?Q?Dw/BJYzoXtTLDEoH53VKvKRbUeXZSgNcwQcjckurqUYD+Z05PamOJ7Vb507k?=
 =?us-ascii?Q?HW5aMEaGszNORwOoO9/MbIKfTRJcJcln6h4npqdhFd6UUHfurbgGcnb6DEoJ?=
 =?us-ascii?Q?5RWiL/lAFuWLWoJ2usQXTHwZhj0zG3n6XsIbnXrlkg7uaeP2P3xLTwGztYYA?=
 =?us-ascii?Q?sz87CuGy/eUUPvxYQbaachvHfI7yYTGIEsOHsejIEf/7B+z8z/2e+babMVHM?=
 =?us-ascii?Q?NbHAgq0CYTuvow4/SZQy/itYbihaWvmfnOQb7ki0V6pWZ2KCiXpfVPcDHZ8c?=
 =?us-ascii?Q?sjSe43rmj/qjcrtz5c32PAxBM8WbCeQbo5ixG6jEwbGxnmv8Ft1JzMVc2LcP?=
 =?us-ascii?Q?bShiCbvEL89WcZ7SGxt9OcbB97RuwcLSYjfkr3W/5LBen6QjZ+PNbbIVv++z?=
 =?us-ascii?Q?4MdVerAETDun/DNfvjChX5zRs9pLBoLd3P5mZAy2qZ9j0VMqoBHHlMncE8J7?=
 =?us-ascii?Q?Kj37JJ/NtQ8eu+UV6188MkLxhJdhys9+QFFxPSHY+LFgktcm9lH9yHjYFaql?=
 =?us-ascii?Q?8MM+OwQ2g/V3cZ9B1BA0c76TkZAfC4D0oU/MgKcvwnAH0Oi75qj84O2nKXp0?=
 =?us-ascii?Q?3gIsgEZQdx+M9+V+foAJ5GOxwQMA6qymEus9gNqlicNyRzc3BymoODaxabvg?=
 =?us-ascii?Q?L51qE81kY5gx9/WxcRmTJ7DZAYQRcWZyL9WgvAJSvVU82GLtCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1lcxUMJfxCVxUk8ZCkSv5Fg6yHcBUG8oX9do5zqRp9dFFlpDE3E3YXr7oUZ0?=
 =?us-ascii?Q?9gCaAKYrLFSTKvbthSJw+jWOAIU5gmatTauaa/K/qWadBjiM9QnQkf5vWgHP?=
 =?us-ascii?Q?v9EVNj/vg16Lb6yeWCX6/PXrSJS6VzcS/CfJLWr0KSbmO/JqMPnMf3SnSW7d?=
 =?us-ascii?Q?2kCof1vRmFq0yYmqa9uwdv6ElOH6fW+bF0U0oBUNhAZAD8JKolkCkHF7Mv7B?=
 =?us-ascii?Q?coRbW7DcdEiUFP4rhO0Xx9MV4eai/I8tdQyah7ZD7+G+rXIH/ailCbk+IC09?=
 =?us-ascii?Q?EfYNO8J0xIs8MvckSnI8PfV17A4S6yzuuZVRIqsNIqna+9U4tEsJSa0uP8P3?=
 =?us-ascii?Q?N43LQivRSouvkdoVhS3lhtc5GrB7YPG4NtOdYqJOfW7O7+jV+/tK6SOoXkU0?=
 =?us-ascii?Q?NHxk3uFIXy1UEF/+uu2m04oQzgx64fgQMyupBlfL6AxWzg7tvOiAir31PS//?=
 =?us-ascii?Q?DEeMItpFZcJgaDdiZsNk6y1G/lKSbnhlynkjnNry2igIcIX73fLTWUhyHuyJ?=
 =?us-ascii?Q?QgEuyWV1Ic/PXK+QI2MDQkiexn56YNNJzXtb4zv9qysfPKR9fIyVVsw9I/V1?=
 =?us-ascii?Q?VG7D25ua86dfeoyp5o6bF031Ms5P9fGI78YuI6f4I0IXMCI3NLk2/4PXXDWk?=
 =?us-ascii?Q?MM2X3SibbOaEv+gE0mJFW8exSAb+Wme2GHazoTQ3hsVdRuqf6lxbxN7YVr8U?=
 =?us-ascii?Q?+zRUlelfcdtGb0z+vq3KFNFXDD643pc731wsaLerbFgzdeKHDTWaaErnBRIL?=
 =?us-ascii?Q?ccitJN3E6tlfLdcMuQ1XhKSgXH30JKmrRbdhm1afFXzaBGdUOLublGCD2Yqc?=
 =?us-ascii?Q?YzwLMqy4IK903BnyHdaJPCTslDqj32iktwP2M+YNc0FvcblCgI0TGw79C8xf?=
 =?us-ascii?Q?lrLlEgZXCWUQfwxUJyzPQfo0RX7tvob5gdWzkun/oL5yEJKBsUVekK/G4bh9?=
 =?us-ascii?Q?dBWh8pHB7AkMCQc5r5GdhlZ5UMQrapTWFR6eCR14C59L6bbvFFDFtcmzR1nh?=
 =?us-ascii?Q?obMBXJ20SzgXrsj3rFypbXOUCZuHccPqO/vf/U4YCuqsDMqzIp9PvmkYuJEt?=
 =?us-ascii?Q?CAlncFmyLwIqE4u28slBex2v27Wqixm3+AxHnI/q71euazTYcZNInvgKnE/J?=
 =?us-ascii?Q?E2yUcG6nGUbaEmZBMHomuX1eNy441CWY4lPzgm2QAZCZdhKG8zKyr4sRQmY4?=
 =?us-ascii?Q?Sd5PgUMtFSj4GzpYEALomgnJaZfM6Jp7hKNsSlxugDrPeRqceEm6Sr83rX4W?=
 =?us-ascii?Q?fBS8EVJGMPJM0p9c0+jxrCcRmwWTt4XhuFJO5SxYJ8CQnygI9wF94RgrGdBG?=
 =?us-ascii?Q?EkkD6grEoXHMsTOS4SKgk1nv+/ExGl0Mo19gesk3Ku1fjLLDYfuEkj3cuOs4?=
 =?us-ascii?Q?2leoMD0mhIHWPHAvrt72yZdZnEZ6rlOXDqmmUEi/gt/BkA9ZP4VwqBAc9Tqa?=
 =?us-ascii?Q?sL6z1/q5D6vOHyJwSC5e603tPMi3SbzYYho3nhECl9z09ikB1AUSJ1glbxts?=
 =?us-ascii?Q?7zFxdX/pHka2RhLmwTaRR07Yan1C/laCniK9Bx5jd/SDh2tal8/8ZXNBM09F?=
 =?us-ascii?Q?nXWcd8QiClGrUQ4fFUuHqajEm2lJGUGNQ6H/6paJOBhh/5jm2259XZNqzuwB?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9255ff89-2ee2-4547-7c69-08dcc20d8d88
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 18:17:44.6136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vTqRGKbWQk5ER6RBpHEIjJm/gRrCw0aIQXQ3eR7+5hiWAYQoq/2baquCXP4PdgCdgopLX6OnTj84edqVUEVO3PWnkeeu+hDkSSW5SdCrZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

On Wed, Aug 21, 2024 at 02:06:30PM GMT, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-08-20 20:29:25-03:00)
>>Use a factory class method to decide what class to use depending on the
>>magic and embed the calls to cstruct in each of them. Main motivation is
>>that in future the decode method will need to seek the binary as it
>>can't really know the version just checking the beginning of the file.
>>
>>For now, keep the open/close of the file in the main function, but
>>eventually can be migrated as well.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> tools/intel-gfx-fw-info | 73 ++++++++++++++++++++++++++++-------------
>> 1 file changed, 51 insertions(+), 22 deletions(-)
>>
>>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>>index 3105144b7..0f1da8bff 100755
>>--- a/tools/intel-gfx-fw-info
>>+++ b/tools/intel-gfx-fw-info
>>@@ -105,8 +105,38 @@ def FIELD_GET(mask: int, value: int) -> int:
>>
>>
>> class Fw(abc.ABC):
>>-    def __init__(self, fw):
>>-        self.fw = fw
>>+    def __init__(self, cparser, f):
>>+        self.f = f
>>+        self.cparser = cparser
>>+        self.fw = None
>>+
>>+    def checksum(self):
>>+        self.f.seek(0, 0)
>>+        return hashlib.sha256(self.f.read()).hexdigest()
>>+
>>+    def dump(self, **kw):
>>+        cstruct.dumpstruct(self.fw, kw)
>
>s/kw/**kw/
>
>>+
>>+    @classmethod
>>+    def create(cls, f):
>>+        cparser = cstruct.cstruct()
>>+        cparser.load(CDEF)
>>+
>>+        magic = cparser.magic(f).data
>>+        default = None
>>+
>>+        for s in cls.__subclasses__():
>>+            if s.MAGIC is None:
>>+                default = s
>>+            elif s.MAGIC == magic:
>>+                f.seek(0, 0)
>>+                return s(cparser, f)
>>+
>>+        if default:
>>+            f.seek(0, 0)
>
>Is this seek() necessary? Looks like functions that use f already rewind
>before using f.

yeah... I went back and forth between leaving it inside or outside.
When we add support for GSC we may want it outside since GSC basically
adds some headers before the  gsc_cpd_header_v2 that is used by HuC.

I will remove the seek() from here for now.

>
>>+            return default(cparser, f)
>
>I believe a cleaner way of doing this is to have a single "constructor"
>variable so that we have a single point of instantiation. Something
>like:
>
>    constructor = None
>
>    for s in cls.__subclasses__():
>        if s.MAGIC is None:
>            constructor = s
>        elif s.MAGIC == magic:
>            constructor = s
>            break
>
>    if constructor:
>        f.seek(0, 0)
>        return constructor(cparser, f)

yeah, better. I will update the patch with that.

>
>>+
>>+        return None
>>
>>     @abc.abstractmethod
>>     def decode(self):
>>@@ -114,8 +144,13 @@ class Fw(abc.ABC):
>>
>>
>> class FwCss(Fw):
>>+    MAGIC = None
>>+
>>     def decode(self):
>>-        data = []
>>+        self.f.seek(0, 0)
>>+        self.fw = self.cparser.uc_css_header(self.f)
>>+
>>+        data = ["header-type: CSS"]
>>
>>         CSS_SW_VERSION_UC_MAJOR = 0xFF << 16
>>         CSS_SW_VERSION_UC_MINOR = 0xFF << 8
>>@@ -137,8 +172,13 @@ class FwCss(Fw):
>>
>>
>> class FwGsc(Fw):
>>+    MAGIC = b"$CPD"
>>+
>>     def decode(self):
>>-        data = []
>>+        self.f.seek(0, 0)
>>+        self.fw = self.cparser.uc_huc_gsc_header(self.f)
>>+
>>+        data = ["header-type: GSC"]
>>
>>         HUC_GSC_MINOR_VER_HI_MASK = 0xFF << 16
>>         HUC_GSC_MAJOR_VER_HI_MASK = 0xFF
>>@@ -167,40 +207,29 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
>>     return parser.parse_args(argv)
>>
>>
>>-def calculate_checksum(f: typing.BinaryIO) -> str:
>>-    return hashlib.sha256(f.read()).hexdigest()
>>-
>>-
>> def main(argv: typing.List[str]) -> int:
>>     args = parse_args(argv)
>>
>>-    cparser = cstruct.cstruct()
>>-    cparser.load(CDEF)
>>-
>>     checksum = None
>>
>>     try:
>>         with open(args.filename, mode="rb") as f:
>>-            magic = cparser.magic(f)
>>-            f.seek(0, 0)
>>-            if magic.data == b"$CPD":
>>-                fw = FwGsc(cparser.uc_huc_gsc_header(f))
>>-            else:
>>-                fw = FwCss(cparser.uc_css_header(f))
>>+            fw = Fw.create(f)
>>+            if not fw:
>>+                logging.fatal("Unknown firmware type in '{args.filename}'")
>
>Note that this doesn't cause the script to abort...

there is a sys.exit(1) squashed in the wrong patch (5). I will bring it
here.

Thanks
Lucas De Marchi

>
>>
>>+            decoded_data = fw.decode()
>
>...meaning that we crash here if fw is None.
>
>--
>Gustavo Sousa
>
>>             if args.checksum:
>>-                f.seek(0, 0)
>>-                checksum = calculate_checksum(f)
>>-
>>+                checksum = fw.checksum()
>>     except FileNotFoundError as e:
>>         logging.fatal(e)
>>         return 1
>>
>>-    print(*fw.decode(), sep="\n")
>>+    print(*decoded_data, sep="\n")
>>
>>     if args.raw:
>>         print("raw dump:", end="")
>>-        cstruct.dumpstruct(fw.fw, color=sys.stdout.isatty())
>>+        fw.dump(color=sys.stdout.isatty())
>>
>>     if checksum:
>>         print(f"checksum: {checksum}")
>>--
>>2.43.0
>>
