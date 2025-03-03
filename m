Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB393C282CD
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 17:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC543892F2;
	Mon,  3 Mar 2025 17:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxGy+4xq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE182892F2
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741022695; x=1772558695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QlgbQJfO9zqHwbDlDlH786qgfhSz5QE7g8ZmBMcYupY=;
 b=MxGy+4xq5Cxwe6IhrQncvH6tjENnrbTTY+j9+roaNxzhehpUo1cg2KmC
 le95EavWESApYHYxkW7MsX/u8+Oeu29FQ28jtxA3B+vGZA5yS6iHNUhsr
 hjLltj60LH3xjMkm5M+W9S2MCvUYjLCh65VpiriWaAKc1hcXOspOtqmWb
 THSqy6Cu0ZCWGgDytMR/DYZFm0z1XkYjol9OL2UR5YylNb31d27ZT/veo
 XXNnXJKVFUZ+2DKdoGnSq5Gqha82sxNVupB13EBVj1YAHoSjNTFJ+dndx
 nB1MfkV+ARiHXkiaDWBGZi9FMcQFb+Lph6zKljIhpykeqkM4ShzOCXAcm A==;
X-CSE-ConnectionGUID: CqBaAL55QNKKGTX7iUGHxQ==
X-CSE-MsgGUID: Ce2iImPrQCOAYtqUYZYr6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59458803"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="59458803"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:24:55 -0800
X-CSE-ConnectionGUID: mq9PokVUTNO5ZzVzoCd+Gw==
X-CSE-MsgGUID: 0twjARMcSpSC2NRt5JBCzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="117844201"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:24:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 3 Mar 2025 09:24:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Mar 2025 09:24:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 09:24:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8y1OsGjP6j5BR5bOIS74+V4rRWBsA6vwtuatCOkzr9xo+hCzEp+L1vEFcRWALGtX07LAC2qr6UIS1+7GrjsRNKXfPkXXm9KOFVy3hu91tCdjaMYNtIFZdzZuex737/ujsvqHETwCO+hhXEiKIiurQAcBIxQl4AF8Yv9Jpon2OlHRchMxScgHjNemwKK4OfAAYOu1TvwhwrTWapfZaWebtaDlz2TukSP9sqbxFUqLFGquVr0S+zKvBYnnImVmnZe7EYCjjb9SmOXd904qdksIHDKMY2bZqJxlekOB70JSirRs3db1z7xHRN3I6DgkPbw208WuROUqby9yNd6hMvgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlgbQJfO9zqHwbDlDlH786qgfhSz5QE7g8ZmBMcYupY=;
 b=IE47Gz44MigkpRUo6Dp1Q0CvkE0LMNHQUF/uFPMlQjJO2LRflggNf5oq60ol8bAhCSsQzi5khJUDxWjVSTxxKJxUvr3RhihSPH3NSFWUk58vt/QHLdZu3umvvZRbVzGv71qczbllLNhtRCUz00eSieSCAUd5JJt46RqToM3nGcCwd0qPECojfCFa9VAtwlliBJCd1SB97i5czn+jt88RIOFFtt7NLUzOU37RmiENhzdWQyAlpu+01cIK/QbUMDuj7bypp/qFY3/r9fBFl38cjfQiGr9qUeE5fYN9OJ11oPbuqSms9cJEu6fpl95sPBHhjYezF/iyrzMGwL7gomzkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6511.namprd11.prod.outlook.com (2603:10b6:930:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Mon, 3 Mar
 2025 17:24:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 17:24:18 +0000
Date: Mon, 3 Mar 2025 11:24:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_create: Add test for low latency
 hint support
Message-ID: <2inlqjkww2mrakbluyjnuxn4g4o5hepkuj2wlmqt7q7z52cduy@hkhodxrhnozy>
References: <20250227122117.711646-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250227122117.711646-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0309.namprd04.prod.outlook.com
 (2603:10b6:303:82::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b9b233-28cb-4410-8cf4-08dd5a783ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k2A7JUAl0sXaYlLU14bvR/cCyeizNawGc+WKSsi3UDxaepgFlut8YXybGJRU?=
 =?us-ascii?Q?ifJiLvw7FTaaY3WpAl61V1HT9sTWlQXr32IMhNtPKIGe8fqOq1Ho8jhxTZqF?=
 =?us-ascii?Q?2yz91M69yR0/FBpXQTLmllmfMcCsa8qaa04PAXwnBzeq35bjdvt2xD7sRLWu?=
 =?us-ascii?Q?CB9QyBzhu9e1xaWERIP5AbkY9udpZL+DnlR2pjEajXt4EQCgGSlFuY7jMPon?=
 =?us-ascii?Q?JT9Ds4JvBaKVgB9OHqHMYYiui5EEoW63XeiqdC9w4Ql1vLc2KOl1eCDZAZEY?=
 =?us-ascii?Q?oDN46IuUQIDH4u4MG2FiVZQNVtuVWzuhwVNrVwYKHJLN1nk8H3GxsJyTcCzb?=
 =?us-ascii?Q?nLZG+9SNIFV6yROFAGFJuKEKkmTpcJc6It20ND6ffSqBlI+qVYQEAG4xU2Q/?=
 =?us-ascii?Q?4Cw3X/64P9WsfLcmP88p+lIQFJpOofMSGSEwyC/SMjrNI5Ny3PUOa1I9kouJ?=
 =?us-ascii?Q?Srd4haRLEA8f5rgj54UBs28+1TPZzLjXTJwgKnbV33YK+x9AWUk8NKldPmAB?=
 =?us-ascii?Q?VQ8saAy+5nHg78MEImzdHWPBSqouDh22LOK+5lHpsw9CcTgc4HnXXjGZwJmP?=
 =?us-ascii?Q?w2akPLMarshUg9OObgMlBe+80qOyiTQxcu0VDaZ9dzizkXuZ2wL2HFYMFfck?=
 =?us-ascii?Q?6g9U1kwHVDTeCAP1knMuO8O+Wf+LsULbX4YO1D6349DWwwUsKnexHaXkQzty?=
 =?us-ascii?Q?f7KMZzam/V48OEWn2ZD10iokpKrSukT7vz+pddVBTLLgYyow/T8YXH5QDvWG?=
 =?us-ascii?Q?al6CF9Y3MOJ/2KGOEA/UeB49c0Fdp281hmor+VvtvUm+RJ7CwbFTWS4Ui3Eb?=
 =?us-ascii?Q?DOnUW8va9ilKAUT2KBI30CvXUM00fhkev0xl8FGhI2zrJysLYU+iZt2UA498?=
 =?us-ascii?Q?lAG+qPEgPbSaD/ExGXr3dpVj2qnw6vqfim0jK9b+Sh1agxy0pxr2EE0wOY6x?=
 =?us-ascii?Q?enuRFSa1iS6OXGRBucEYd9pbsCQ0F0d9R1DE1hDi7hWok34uxdK+gfcyLXzJ?=
 =?us-ascii?Q?iM/ufbJmVgA4GHto54/to0rAuf51FqWGwvkkkbO1hK3AiTMAtFIHsplItVNq?=
 =?us-ascii?Q?aPMc6ODj2rqKuuKf/zvLwJWKeQZYukwIWZuw19eoeJVqyID4n2M2sko23Zyz?=
 =?us-ascii?Q?BR+M/xYz0AtSZ+HklTlHoUmEo65EGIVOpoNI9Cv/bPzgEaofO5YYbi43TJDz?=
 =?us-ascii?Q?HrhiBur3ZyMUHuEhh+8SLxJZn0ZuJ8cQA6N0QeVfrIsKM225WqyC2MzUqR67?=
 =?us-ascii?Q?gv9ONGY5JDxZhIyEFc4tUCOgnf0tsk132TM96jTMfMKJA8RqtQrS8vICxrc6?=
 =?us-ascii?Q?BeLzoWg4EF+YOnu7OUy4846woWC1xARJfOq9Y84GTg5IgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JXO69UH/A07uVygb6575kDEhKIY7s0lg7KRlKnWWNLj5uOA5nyMYB6eR9r+c?=
 =?us-ascii?Q?/q2Tw01i+hyjV1/p2X6FTx4wpWXrxyY2zkgXFZ4WepsNFAlbsTLeiQfhdZHF?=
 =?us-ascii?Q?S+zplaSAflldEVS3E53S3CdQoL1/kcISFPUox7xk/a5sB62gW4vQ1aTOAVRK?=
 =?us-ascii?Q?F0jQok38iZg7Aohw4RxBY/yPctdkusZw8OCP1mq5j4XsxIiM+IRl95eJcon8?=
 =?us-ascii?Q?xKzO5+eaal8chuLCPl6U1lXrJ+wUT1/F5niCgFZOZrJpqbQVxueO5klQz/Mh?=
 =?us-ascii?Q?Nxf1HT7MMACXI8JiHkItb9LgxgCJ0thoWfliZbjoKM5wTo89wdlKbx8uowrD?=
 =?us-ascii?Q?axY7Q7Kjiw2j+j4qT0QB+BMLob25qV0dvobHvh8H2mFkNN+ye+qcvsMljfH2?=
 =?us-ascii?Q?095RQ3uNbYGyElgSpqdRyeFvYXq1KKTH4kF098gFHL/KpMPCifAjk1AiDKnC?=
 =?us-ascii?Q?5cKNV+/u6vh6IwTVb7xzl4Boq/TjaTousTB7WSVVCeBztnqrSc1pMpPDROAZ?=
 =?us-ascii?Q?KBa+vMQEx9SoKeflg4vSSzT22naHsiGf6zI5CwdP2wL92GUyoj/bDEILBYu3?=
 =?us-ascii?Q?aJAZ7ASeonxcWk34f5rbY3JzLBzmrJxgQI+Vh1jD+LmhtpDrN/HSk3Z+OkAq?=
 =?us-ascii?Q?1VWsz4ilJkmvU4nrKoa9rURLK4zqsOp0kIu9ndlkwvUlLc6p5SIetPZpzLzy?=
 =?us-ascii?Q?awxH47ebE7V/+a8J8+z9lX4L3DNjssurtH2/Frhvg7EpmYv5kfqGSYIv8kBx?=
 =?us-ascii?Q?YAGXlHeHOHipLeLL6GPeRv5z0EQKGPgYIvGNzFydY+fNSOW/2bCfuRQVG20f?=
 =?us-ascii?Q?dwJ3utsSRNl+wPx6AlWWwc3BvLI6MDz8B0eJJXVtkmKy4OpAix8Vrcf1uqpx?=
 =?us-ascii?Q?iiwKyYyNgIjYyO70Fbpf14UZS5GE2lX/KsiihJze0yy/sdQZlh78D/97KMOZ?=
 =?us-ascii?Q?Iic721OFPCtJFLsE8tObSZktsrN8muCWLf9s8PBB1UnPYcg+uu80NedXcPCI?=
 =?us-ascii?Q?0vF5DbjyMqvPdfWwQaq4wKtOXCHihtyx0531bSu4QlemnuMG+DQMIYRsOlXt?=
 =?us-ascii?Q?QKyfife42oQqHeNhz9kJKRtKee41Q7DQNAN7L6D1CsPXeJYiObWp0Vc4pWmi?=
 =?us-ascii?Q?jrOLD1TseJGl7CILwHMZx1RjG9DNribnbnCQ6Vtc39rgb8sipnpnu3q25cNd?=
 =?us-ascii?Q?bJGQ7JmxfaZaVl7wGSjbel+24bE1gNV3bcJf+6AnU/jEzqTY16BT8kUKhRRr?=
 =?us-ascii?Q?JSn6S/KVPhjOmk6rpdaiQ3ngfd01Lwoe2nWqM0hbuFV6vwz4+/Tb2C7WMnuU?=
 =?us-ascii?Q?ATIUV1FZKExuSxl1AnwR/vA7wJkvkUlLp+p5fNlxxAvkx9c4uDC7wnkua+MP?=
 =?us-ascii?Q?XZWhNTosSrLnV1Ajw6Ww3+fCDZps58sEVCutetV3sk1smM0Pxt1zaNzDR8XQ?=
 =?us-ascii?Q?eC0mboCkYwK1m/m+Ga6U649zSkD9fH2Wh59lBh/c29ek8Q6RXIHot+AP65Ra?=
 =?us-ascii?Q?26UmPEXpcOYhUgIYd/RSUb8UlfQivfIDs1k1Lpd7Q02ZYjTVxOG/W5+3hJpp?=
 =?us-ascii?Q?sXOEPmctixLuvO5lZwN1kMyCd3Fvi+m/fuwGcLk6gJM3gG6Mtb58+3S/4h6W?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b9b233-28cb-4410-8cf4-08dd5a783ab5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 17:24:18.5757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bjtf7P+N3MV91fQcPhXO5vLJRKiv4aimhll0RXpciUmUYJFNU/oZ4nYcgTZZar9F7x7Jd4JaXJxA3npCSUzmSamo5LKDmmvKL8szpt1BoJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6511
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

On Thu, Feb 27, 2025 at 05:51:17PM +0530, Tejas Upadhyay wrote:
>KMD introduced low latency hint support for GT frequency
>to guc. Lets add test to validate the feature support.
>
>KMD patch:https://patchwork.freedesktop.org/patch/639677/
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed, thanks.

Lucas De Marchi
