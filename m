Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DDDCF9C68
	for <igt-dev@archiver.kernel.org>; Sat, 21 Sep 2024 23:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37CD10E0FB;
	Sat, 21 Sep 2024 23:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBrmBIBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0229910E0FB
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Sep 2024 23:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726962642; x=1758498642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gDXlQ9tnSdCJcA1N8mQ2Kfz0G8iEx4AVnqoRAyh8d1Q=;
 b=ZBrmBIBHeYRbmUmSLnqsxbSacshxAXLjVBumaeKvzpssnZDEqwpXIPj1
 E4uj9/tInBzjGDBrwFhPi7WVGqjc7AdVgC81auEqHOP2cNUW23/eQmBz4
 WCo3r7QdSaFByy4nXmeUPWw1wPyVM1GFh2J8cnVYXZXwPnvvOHOLkAM3/
 YPfXzbVgIDb8iH5zCa86FMd4D1gV71a1wWYOZ6pCyU9lnxH1RbwZol1kV
 8Lpdkwhm7oe5M8rZ/vyx7sMAHoohfCHk5GDKhMUQqMcj5R8yc+0bBg0EU
 4Zdhw+XqbyttvZbEWmNGYEJifBza1S7BSVBv5VKkbuOBl81OXkEp0nBa5 g==;
X-CSE-ConnectionGUID: Lu0kYyD0TMie79Br06+3Vw==
X-CSE-MsgGUID: 2zv5IhaNQFqcKhVOICAM5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25815708"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; d="scan'208";a="25815708"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2024 16:50:41 -0700
X-CSE-ConnectionGUID: 1z0UY69gRLy99CybIhVrsw==
X-CSE-MsgGUID: 6q4G//elRMKS7qxknoONUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; d="scan'208";a="70959824"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2024 16:50:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 21 Sep 2024 16:50:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 21 Sep 2024 16:50:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 21 Sep 2024 16:50:39 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 21 Sep 2024 16:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7jbABM+FOOmMABokuZKOmJiSBmXCAT2JoUh7d6ggxzfWTDU9IrilHMizPKkjXRsedOh3Nbp4mpQmaFMmKQ5uRmSoakRVYWnOZ/b1P/q0HpanWhWc7ziEaleE1MADRhn0BXyXah8IGHma9R+315Mpj7pf1cnaimyzP/mNVAEf8uXcb1HsuF15xmzE3xKJCEID+Tt+lREAfarBoZsEhvdwGlAnIto5fBRnn6aytquHU/jZC2dIg1sG1QghG6zyA0kI3UzvvBVv3BZAhMp8QPQYh03G2bGH1xN/oFzP8q7MCmzYcO4HTHUE6q+iy9W5Xg2nC4iAYHeucigONIa8afSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDXlQ9tnSdCJcA1N8mQ2Kfz0G8iEx4AVnqoRAyh8d1Q=;
 b=edFcuZLGZxIai8kmW4Yb6dkbpczwHsSFQ41zREQRruHxeNp/pwxtEB6k8dTSo9dhARv3W7pB0lWlRFvVej8xZuSObBbVGW4zb8LyMckPyCxRGSUmjNBEq7CX0/inPxRuR/U2elcnTZbZcx36MihNEpgScHMI5FIdDttYrgOT2YPdmYPX11oqpGiOD8OerM6iSL620NwBh6n7TvkcxnRjr+NccXkKTrwO/Pv3x2n3i0Uf4CmMZm/a5B1MzhGT7Kr/HV13UakZ97ceLUJQnIy47inK1ua3vnbMCV1a2jCQI+FbIFc6n5DcMhXn+UxjPjMNR0dnviq1+zRFsXQEPxCBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Sat, 21 Sep
 2024 23:50:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.022; Sat, 21 Sep 2024
 23:50:35 +0000
Date: Sat, 21 Sep 2024 18:50:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel-ci/xe: Remove kms_rmfb@close-fd
 from blocklist
Message-ID: <ief7jizwk4mugl7o4fdpz2bib34fqs7c7ofm2i52tktfo3unn4@rawlu3dp3a6c>
References: <20240919193250.1439745-1-lucas.demarchi@intel.com>
 <20240919193250.1439745-3-lucas.demarchi@intel.com>
 <DM4PR11MB6312094C11E01C17E485B10C906C2@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DM4PR11MB6312094C11E01C17E485B10C906C2@DM4PR11MB6312.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:303:2b::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 76cb8a29-23e4-49b4-66fe-08dcda98302b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pMjLt0qt2sOZDbd0SKftWQwv5YQw/xvuCVZGK+RPDPFIe7BM+6pwEIUaxlxT?=
 =?us-ascii?Q?+IXVXpThJmN6/pDCGzi5BTKbBRs5GrGWM+w2TrRfk0c5ZPZnofVcvestsuTD?=
 =?us-ascii?Q?YBK4Te5KJ5DrjpnK8jQXEf3J9yj+KPBgsmGoXjiiY5E5EHG4Fq1Egd/JRuO+?=
 =?us-ascii?Q?gTDZiiWapg9QMx8D2op7jFoVWqp/qWDb9VrgyZiC14ajqb/gF14pjSD2Z6MY?=
 =?us-ascii?Q?Gx1ddEIeyYTWpptSS7jW1q1zCkPR5gYiQ2Pnf9drAeB6QGUTE7/7chB/p8UI?=
 =?us-ascii?Q?FAI5af1N1tjlPCRlMi72xhI2iJzH9QNVj/VkJ67evMp7B9JNH0bDzVtQJcg9?=
 =?us-ascii?Q?3NEfFB/+wTb1o/CVn1S0+8am/mlKcLKg7ROlj2FBq/CNIRO8JOouWXyMyn/D?=
 =?us-ascii?Q?SfiSbW7jF+pL3EUYuTiRToSlYev/qJOI/RR08DVjvBbKCibQ+GBHh/2dKUsT?=
 =?us-ascii?Q?nhm9qACH2OY1pTH0SrM51LvJvhFqZ7Eyf6FDvlWqRqlVQHRZCSZqArvQ1fvn?=
 =?us-ascii?Q?2g/E58lRKS2RkrCn8x+qscp9rPorre+DHlgymut8NJT+IUm7RSWMBn/700Bx?=
 =?us-ascii?Q?juoHBzzKXEdtNQy3lZr8UgZskVZx2sOmLoTiNr+PRFVcMO0E+NB/ABd/EI8n?=
 =?us-ascii?Q?EdhqKcvU3z3gFNLBTaJXKCWQgSQIfQ/LDOE0l6i8ql7V03oYAw0WO3vwolm6?=
 =?us-ascii?Q?mX3aBABvnNK2eBVo0epwS1E1nuM4KaHncczYL8bE/GkoPv4nbmWXhqdVAszi?=
 =?us-ascii?Q?fZxgwUS3pZ/BMpRkWu80W2wPThDSsruWc5bw0OipMLGwLZfzChzbTSCeVVNN?=
 =?us-ascii?Q?WH0r/31HTMa2SVozJ9v51KzPq/RvHx+Sn96wBgtWKBvfuegkHPTCItABZVhV?=
 =?us-ascii?Q?21ub+piMPsxJHyNTP0OXNxbhzkcZsEU9p21RRgClCQN8yfAnjuslrw6bsNKj?=
 =?us-ascii?Q?2zXWOefJvZ5+xnYJDieEQ2HONsNoZnrKB1viU26i1fOgihRQ84KRwB4g2U/H?=
 =?us-ascii?Q?hMxeonpLpMBwq10QsDBc5tGFIEKct892ngC/I3WvNyD6L2XEdy+2eZz41qjg?=
 =?us-ascii?Q?gh8XjsRyRcQ4eosNffxbybpINKICUWlMBZPbExlI2TkS1gKE8gNrNFZqUqBJ?=
 =?us-ascii?Q?3lMG1NC2n7Qrg0X+z40u/4i6C2BpeO2x1FSZF5niYJuFCbjV1rJPzQCT5ljS?=
 =?us-ascii?Q?yYNDxGxpHPWByn/xt8H8lqXEEOK1V+4xHuN+ChG6f0Z3BJOwdSflhVK2CWhk?=
 =?us-ascii?Q?tChQG4SWELcZL1xeFAW44GoELkSN+Kg+Jlfu9DMTryUMUe6Wi2dzjh/8GwIX?=
 =?us-ascii?Q?IdSxyM5sc2qsws9RFFBcxYwGz5y7OK+uj1DI/8KquzIl5A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0qnJZuQFz2P6iG3edr3rp/4T+N/6CKrKa+OqfpCDQMjzUrenKM7EInHKCuLu?=
 =?us-ascii?Q?pxSvsCAWWm4DMjjSnv3sj4HJNQbXmU1A7zDQxRC4Ju0cSK6aCMS2AQsbc2Ei?=
 =?us-ascii?Q?cddXHtQyAyUSe/Hw35/ErHMLVW6Dj/kwNcLDyb5VA1mY0DetwrRE9yMShams?=
 =?us-ascii?Q?DQbaggPVaob1xd+5GfG1VtSOm3vSNizceZ8C4NkhO9vCLU/9Dk1E/Eg8Wamp?=
 =?us-ascii?Q?EW31iTHcvTXfdEpwp8KFfOlWfTP6F/xKEqtIgdmnwNi425ObQ8iSFIeNI+Ti?=
 =?us-ascii?Q?/g8vG7vC/g810aYfCQaznT1U2MDS5bHoqoHBwSKYQGjKPPIUf06jra/1lmAu?=
 =?us-ascii?Q?a/2n3sawrpVqzIoOokBTtt+DVxbM/+Hyt+W6gZnLs8s0ect7I3cBmrC+eOta?=
 =?us-ascii?Q?TwYRbmyo+qyLYW7d8OFIUHyzuPz6lHifdgEHMyY3J+dQd07y4pcFmNIGw2bY?=
 =?us-ascii?Q?XkGhDtnmRd0gIJssuaNyH6Dd8MZFiqaA3WepW+l4L4wxiwuxSDj030nm9Tls?=
 =?us-ascii?Q?ueATvjBu08NEzC9PKWFnNCS8vBKBKEIr0YMyOruD651BclUgmSkEgqFU6v9B?=
 =?us-ascii?Q?+3gH5lmnxKcKsHuhJgSTsoM+zwGnjGZwYHIkDl6iqR7K+yqW5god0UZLI7UE?=
 =?us-ascii?Q?Uyg0Te5fGsoef1KW3VNgH+9OqCRcO089VZaLAIkFgM1zXiNMV4i9El1vyNHm?=
 =?us-ascii?Q?6YqMpgQcylqWSeIlA8Vmv9eD2fsZYUJNtKDGcg+E5DehRzSG94anwc3005+n?=
 =?us-ascii?Q?VPcp7PoH5QEdvVEduPWRQaI8nXZDgzQV6JLA3OqrRVCdnvr/ilV58nxq5Pb6?=
 =?us-ascii?Q?rcNpiIVOHECX/E3r1wzrvnfWptaM15/OvDhmDKkAVoF9WXlNmJPUhNMvxOsQ?=
 =?us-ascii?Q?5OhJ0a0wtmIeoJlyGdvE619wmG0MdJOL3PkNvsbr/XQXWivy8h21VYCS7fkp?=
 =?us-ascii?Q?velKFsXvMpaczobLcnNbvaYssv20geF3L0glu9nyMt7YUadqeDbPFZoGHZP5?=
 =?us-ascii?Q?pZE/31jJN6K5ypnmgzmylU74X/6G32xB30WuFtSww+wSI1CS5iKzXsxjaD6e?=
 =?us-ascii?Q?sMjdiqnrmRMItrkya/g8wgB+ISRH1J3zKZi4TnGv+ZgGOx9u3Q8M7qxDnv6H?=
 =?us-ascii?Q?NdgvznFGg6Lu6mtrnsLspD0QrEaHaz3G96Iq0V7dcyXY1e64v8Ij07AC51uK?=
 =?us-ascii?Q?rzpr6dOVNP435cfMcN7+tPsBGG8jrHaWnZmc3ixLWd96OnHn7MU6z23YtAIC?=
 =?us-ascii?Q?0VTiuMWFF0CY0av4LPgN/k/TT4VpMK/6T5nQN2Sb4OuzUgcgDwX2oixyg+KB?=
 =?us-ascii?Q?sjPtHsbAvVOK8sW3Bg46ntUpGbx/wDrK4M4K2UN50g9oWtJXZyCfxevnDdOq?=
 =?us-ascii?Q?tcOEUX3BCi5M9J5XDpPx8cuR4lc/ucgyCvsfCSGbqxklPxQcpQ0Q0kfF+rEo?=
 =?us-ascii?Q?SU1+cN25YvZg9hAuPR79BiWXCujJJi3AK67PBiChcAdu83Wi6r81ifhhKmQU?=
 =?us-ascii?Q?Sf3SBb+uUsViK7fCq1QBhdypm9uLvjkmdqWpjjK0ekvuvvJ7hqWrbUlEDq3x?=
 =?us-ascii?Q?2ZvwT58DdKJip35j4jg8TTCTYPKlZjvaIiJCzEeG4j70yUKucP6sGpBTk4vF?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cb8a29-23e4-49b4-66fe-08dcda98302b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2024 23:50:35.8672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+4eElA49RWobY5VRYlzRAMhMz7s+YfH8r7YhW4yre+TcprxeSaef4cBXbnnWEdqkAbvNq5aHmrNV3nwPYMTHsbx7SCNZPq4fWAGFPtS9kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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

On Fri, Sep 20, 2024 at 04:40:01AM GMT, B, Jeevan wrote:
>LGTM.
>
>Reviewed-by: Jeevan B <jeevan.b@intel.com>
>

both patches applied, thanks
Lucas De Marchi
