Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC786C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 21:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690D910EBAC;
	Thu, 11 Jul 2024 21:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/6TNv52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157FA10EBAC
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 21:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720733702; x=1752269702;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qPZXDTLGr2SJH3vO/OC8qIZkA7mAFxa0WOMc+NmB850=;
 b=n/6TNv52BT+lL7v2sfa4+UjbEh0Amt1t94533I8mhHhnkqrWgOTFLMMk
 /RQToEkp3xgqps/i+UqxxzKWaThD8D7o2a6PeiJ9Ggd5ok7z61q0g783u
 /OB7cBT1Li6ZylsSN8dkX1iKUoCfir07WdtMJ4LxKtirLMLvb177v12AG
 UWuwjHj6waipn+EIXXSh3L59Iz8IxRaFqM4dxz0NysXr1PWwJ+vZrUOfU
 vkX7QSYfpRzsaSrnkmLO16qv/8U8OoyyNrRkdb1H1pjXlArZ2h6pE7XhA
 VOjMNz0PnCh1Lkq5iyQGchw/ZBXC2ZNO5tVjGowlBUN/2/t3IbF2LDjMt Q==;
X-CSE-ConnectionGUID: w9COAV5eTo22avxCnBMSjw==
X-CSE-MsgGUID: oHIZrYheR52aqCvIii4CPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18104430"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18104430"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:35:02 -0700
X-CSE-ConnectionGUID: loR1HJy8SiWHk6q+l/kuVg==
X-CSE-MsgGUID: 0hNgZkRGQgSWxErZ9nJRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="53885042"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 14:35:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 14:35:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 14:35:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 14:35:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQog4CUBl+G7x7RDmYPIKbUUsWwLZzSUqUyy/uA9NhORatrdZ0r+oGGQoE57B4wMXBikJ1xqbASdymp7Oi/OgrjqTjaF2g0WBG5jSSg6fBvdrxVa0yWGv/w3vsD4D6zRDKUyzrPUQ+Wg9Hqbmn7FLkn2izpPo1XzCiLDbrl23C77QgygJlmgdBjErWw1ko+dtz5pHB31Q7RjWBIQOapZk3ztdAQFq7sirLRvvPorZZZTdL151UNKejP0RsEPc9Pw5djroQzxDglTKrOXJhqD8d9hSugqr2jhNu4BCI0DM1f0eK2ekUd+LXx/Kr0f67fZiRCI4MPEEYenU3NWLYgzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfDMQZJs1JtpcTm8sm01FU/KCf+JuFEn5Z97ubsr3fI=;
 b=ibrnw6qVXpOyEstf/j3+HimYUhzIkvcToSAqCWG7N3ATa2EBKQZGkvf/vBiLYpKeLt/hr6mZzhtBa4wnzsnGna7OwhdMvvQ05dh7Qcf5q9hXIBUtr76DyUN9dh/G8dQNBrzpfltQsFTaS5Jw0CFTDNmZOJAPrJMgqr2MJpHjtXsCQvoAaBdwDp5/nbgsld6f8l1G8DhHBJZLiZYZ4PTmTllTQKyLJy81v9bO0Ehio1t4rXOmGhlwLdvU+GdwOxcjzontklaiuCwQegXD6TQiYwwJ+hoQe5ywzoA4nHIozu7plqDzLr9zWXUbNWtkEvyqJTW3tAz0tgm1hAakCkLW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 21:34:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 21:34:56 +0000
Date: Thu, 11 Jul 2024 16:34:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 05/10] tests/intel/xe_drm_fdinfo: Add single
 engine tests
Message-ID: <noettlh7nsb3cpnlrgd3qjocjrnhd5gxbfzqdvvrlmfvg2bufn@4t3diblziurw>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-6-umesh.nerlige.ramappa@intel.com>
 <fjpk7jck3tv5vz63n2n4c4jayo4gt5folbfrnncrpdrblb6kgf@hg3exp46jfx6>
 <ZpAu0p+1DX5Yn7wA@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZpAu0p+1DX5Yn7wA@orsosgc001>
X-ClientProxiedBy: MW4PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:303:16d::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 3649cbdb-f34e-48ff-7278-08dca1f14eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O4vp9atCkYbqKZtY5HMx1jL2K/dgGljDVzhleIG3HIpxxqKKpiortpIpfFsJ?=
 =?us-ascii?Q?8fjArGVeMWaoDgEOeUQ1NjCZ6n493W5Q0KSEKhHaVL9ppEw2phDkgyXJQbbo?=
 =?us-ascii?Q?03Oviy3PUalZEaRWut4jYmiG6Jo5sPLZyaaN/Mk7zG7ruYnk6jx1hNXFNSFX?=
 =?us-ascii?Q?XvTMIO24jdyYrN9eG55+HnN75t4JYu3h0um4XWVUR8Kfx4rBU4QYBZLOMKZ/?=
 =?us-ascii?Q?qV+ncRMkjv6b3FNcKo3OOScyIQqY8SggzB+NklxviT3wKjJCnhoCV7+Xe4ch?=
 =?us-ascii?Q?3lbFOv0jhIPr3ZSN+DhGQQowkde/c2VzP+RDVeKmOSJkgSznINIrSLcNeUHK?=
 =?us-ascii?Q?grte6waCPIzsr/bwsppE3KCfT7swgW2nIsPIhCLkvUnYGLCPLVSi8caGyY5A?=
 =?us-ascii?Q?MrlU1KsZ1vzwTW8Mhiuew+Se1AcMrV9JjogrorGuMrJLEK/JLTBylCTTn/sk?=
 =?us-ascii?Q?2HKRXLW8PnWn7V5PW0H5uPf/cqHfppdiVZWnGeCofVT1b8Q5wvHvw4AnO72o?=
 =?us-ascii?Q?Jt13LBGohYIi898ygS2eMrg8q7fhxrxlD8kIrW9lR+hWe/vcO7743xoaCwjx?=
 =?us-ascii?Q?31/WUzVzV/gb0/mHlVC174HEQiQ9C94NBfnTpXPqwMhCS1905MCarLFRsYNw?=
 =?us-ascii?Q?68VexWp0z7ce5Q4Vi/OG2WwuDgQBroY3S7CsfC+D3ZRIPdXsxHRLjDhZlSvo?=
 =?us-ascii?Q?pMAExfJJBqI/fARksPYCC8XV/NMBHE1vKbqNeCTT+sEEDjzOZj+Oepa1SSI6?=
 =?us-ascii?Q?e1f2bsmDkSCr/Zra/bwewhDYBRmeRj0YwwMIb5AsMwhQzUf2J2PfhHwwrNcS?=
 =?us-ascii?Q?ZZaLn/4J//zzezZjTjUlvZctI1ZXodfNGWpFfGXdt0vLjHThjEclmcS7khkJ?=
 =?us-ascii?Q?jc6yJLXC1AozVbIgIFt92wUZ4Z2lXnXrAnSWdW9Q8lRvRHwY1u+8kEQxNzYg?=
 =?us-ascii?Q?wbDyW3ZawWVY18ROHqEzq6vHSoj+9SJkycaNZ9mQwiLHzsEW+1ftKl//NYuz?=
 =?us-ascii?Q?I6NJVG0hhxQKHLqWilQ9rFXY9VhfDzmpi8VVvLnHVKnke758G5XaTsK6Hh9r?=
 =?us-ascii?Q?/fFJ+mleWylT8juZq/Dujy8xzliiQ+2oRfSZWBGTjbG/CrrMyiGS6VLRz8Nw?=
 =?us-ascii?Q?kjKRzV06jEAN3BqyE8tVZmYue90o74ivgGRn9xrbnxejgBCTVDNqinj+e93M?=
 =?us-ascii?Q?SFwEUXtH4a7C8rTNcFzCVZdEQNEuTaSa8y77VkW0bsjz2xoyZi2ct3g7P5Gs?=
 =?us-ascii?Q?WNKNQ89Y4bNqu9/I7stVmjNDXp16VuHVvUFybO9EaiNyGWsempJnMp4vezTw?=
 =?us-ascii?Q?qi2fIDfrBzzCuzQlC7QfYnxc8VekprLQH7cZwSxwiL2c+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zvFp3hrK/u4NBSY3SOo0ljtSJhPB0SgRh5PWAuPOdzZzGB2t3prCDkmv9Wc9?=
 =?us-ascii?Q?kUuBHlfethbsqycaTElBZcrkLN36vD/52htPZRzJ+GjYSx+PE7PxzQFSbGev?=
 =?us-ascii?Q?AJ7HIJB0Yg8cDC+qJx1PiRqgD7I5ckg1YyJ8zMAUewoX8HpVM4pL4T/Ec5WN?=
 =?us-ascii?Q?2+dYoWjJ8+SznBRa8cQ94qvirS1TetMsUxsirxrJN2hD52qAJhBr4ofurjz3?=
 =?us-ascii?Q?h5TbQ0BQ00yqURFaOuLwhaUNFmaIXpHLRrkCDll1vd/qE1HP5bNHDxEnX0Dm?=
 =?us-ascii?Q?KCeiWr49cqgyFjTR9TR8wFr51eKkepEd22mnkbIZvhUzGF7s5LEME6/W7o6x?=
 =?us-ascii?Q?PJL2mkWuS7Xc9hLxxsgoO9YTaFt8X5y2dGuezVeJXYJiXCxUCXvouuJrK32Q?=
 =?us-ascii?Q?Sk55Zt9FT4aBe6EImQELy7A8mX83n6Uwhfq+7dksVD96xiG3pLIv9w6b+ICD?=
 =?us-ascii?Q?4FaTlnOoNDc48IsdOLmLmuKQGhRG3n2lI5ua/nV7w4FZaxI0qnEWoXd3URQF?=
 =?us-ascii?Q?sK7d06mYU8ncyTo+qlJTXJnC/AVL0DjMAy8b1vTOTpnUEMGDEOUPYXo0dd2/?=
 =?us-ascii?Q?R8O+IaZth8MVmp3Ecp1a/KVlWqkcDil70IwBfAc8GUYMKw8P0WE6cqn4CnBB?=
 =?us-ascii?Q?Ns2MB6D9VSnY+RDrkjhAAkP0tgOGy90sZiiragVNhuu5HS3CbjVq8L76Qpl2?=
 =?us-ascii?Q?uvZgse/k9E1WbQzbpE/ZIZS2ZgnsU/8V9mhXq0TP2dnU6vYg5TowDfyWUAwW?=
 =?us-ascii?Q?Lpku2LBRKEVFe9k/MlqJknnzp6CcfhzcX2/FiBxZtzMrQbZUVf8IFHgN6pbF?=
 =?us-ascii?Q?cwyyvW26xdTOUB5vjrm4h9pEiboCgbDg/Q4aunRktsC97FIdGEp+olO6K/Sg?=
 =?us-ascii?Q?1p/1Qn+XR8TTlWBZXjOBoOpH9OXZmV2oqX8HEbQVbsuO/zhXHf0zoR5ieiYW?=
 =?us-ascii?Q?9RSVhnG/ahHoaXXVuXi/OmcMtsnu418KwtjKNk6dYz58qs/8MInQQrudOjsR?=
 =?us-ascii?Q?uA63YD6+Bv7GMxX+N7ImwBOZ5Pj78kxOyV/Vn5mbLjP+Wr87c4NCVmvXhc5e?=
 =?us-ascii?Q?ujVvu8ZUXbklBsXC3rniBRsNOCSAA7KpMOn1FaSVGvtrOhBRoarB4wonCVCp?=
 =?us-ascii?Q?JWC5w0qe1NOPjz4Kqn2dt++9ix+HicMZqZkmvlpOr88DRNuN4vu3smlGRaSI?=
 =?us-ascii?Q?jCD8lwmXUFlnTEziSTbcaK/AflOk2Q2cUUXurGEA8fJtyWoosoeGbErMEN5D?=
 =?us-ascii?Q?yqWC7vWa3lCCrQwO/acOM3xPdOGNstozYFfKbUt0xLJiAWBOCwJ5Bpv+c6xD?=
 =?us-ascii?Q?qCD6zbcoZZcnngzhcYkJpdxqaf24cuQCruiN45EPUT8gPVyDfZuVXLBOeJzB?=
 =?us-ascii?Q?T7aqdbrpRl2dVSaa72/IM0oaVt4fXWNKNJ3Fji2CY16K/RJbKmRMcmoOMiVS?=
 =?us-ascii?Q?EYDnC1GKCVIp8avxxA1e7rXazcVzqL9ALAvrdSaP58aO5gFW6NLK9CLGH0zU?=
 =?us-ascii?Q?uy4aArJPBLMl0mpy4Cd4LYZPdF62/1jK7lCKnbk+UbAvjEz85OLAvFn/Ooew?=
 =?us-ascii?Q?ELkyI7Rc4R+LVjfJsDpU7/QKE6KU1ovh/2+Z7uIKUnQAaWTev+rTFHhwEyTW?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3649cbdb-f34e-48ff-7278-08dca1f14eb3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 21:34:56.1094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXpCNCLQEapCm6EAOG9gmfptK6YrHgtvcAaT6t2DWywD0+7C8WgUl73kNrACdPa1NHhCpsH0utzXes8lXlr08yPyio7P+hmtPEfM6zyC/AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7579
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

On Thu, Jul 11, 2024 at 12:13:22PM GMT, Umesh Nerlige Ramappa wrote:
>On Thu, Jul 11, 2024 at 08:20:17AM -0500, Lucas De Marchi wrote:
>>On Tue, Jul 02, 2024 at 05:25:27PM GMT, Umesh Nerlige Ramappa wrote:
>>>Add simple tests that submit work to one engine and measure utilization
>>>per class.
>>>
>>>v2:
>>>- Drop measured_usleep since return value is not used
>>>- s/parallel engines/parallel submission/ in comment
>>>- Use NSEC_PER_SEC for batch_duration_ns
>>>- Percent should not be > 100
>>
>>but as we chatted later in the review, it's actually possible to have it
>>greater than 100, so I think we need to leave some room
>>
>>>- Check utilization for both clients for isolation case
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>tests/intel/xe_drm_fdinfo.c | 97 +++++++++++++++++++++++++++++++++++++
>>>1 file changed, 97 insertions(+)
>>>
>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>index 037f25e53..410c885e7 100644
>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>@@ -28,6 +28,15 @@
>>>* SUBTEST: basic-engine-utilization
>>>* Description: Check if basic fdinfo content is present for engine utilization
>>>*
>>>+ * SUBTEST: drm-idle
>>>+ * Description: Check that engines show no load when idle
>>>+ *
>>>+ * SUBTEST: drm-busy-idle
>>>+ * Description: Check that engines show load when idle after busy
>>>+ *
>>>+ * SUBTEST: drm-busy-idle-isolation
>>>+ * Description: Check that engine load does not spill over to other drm clients
>>>+ *
>>>* SUBTEST: drm-total-resident
>>>* Description: Create and compare total and resident memory consumption by client
>>>*
>>>@@ -42,11 +51,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>>
>>>#define BO_SIZE (65536)
>>>
>>>+/* flag masks */
>>>+#define TEST_BUSY		(1 << 0)
>>>+#define TEST_TRAILING_IDLE	(1 << 1)
>>>+#define TEST_ISOLATION		(1 << 2)
>>>+
>>>struct pceu_cycles {
>>>	uint64_t cycles;
>>>	uint64_t total_cycles;
>>>};
>>>
>>>+const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
>>>+
>>>static const char *engine_map[] = {
>>>	"rcs",
>>>	"bcs",
>>>@@ -464,8 +480,77 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
>>>	free(ctx);
>>>}
>>>
>>>+static void
>>>+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>>+	      int class, int width, unsigned int flags)
>>>+{
>>>+	double percent;
>>>+
>>>+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>>>+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>>>+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>>>+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>>>+
>>>+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
>>>+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
>>>+
>>>+	/* for parallel submission scale the busyness with width */
>>>+	percent = percent / width;
>>>+
>>>+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>>>+
>>>+	if (flags & TEST_BUSY)
>>>+		igt_assert(percent >= 95 && percent <= 100);
>>
>><= 105 like you had before seems good, otherwise we may have too much
>>noise in CI.  What are the typical numbers you're seeing?
>
>I see 101 whenever it fails. Also I see it only when I run batches on 
>all classes (all_busy_all/most_busy_all etc.). The difference in 
>numerator and denominator deltas is close to 5ms though. Not convinced 
>that we should see 100 still because we are ending the spinners (and 
>waiting for fences and all) before taking sample 2. Still debugging a 
>little more on this one.
>
>>
>>>+	else
>>>+		igt_assert(!percent);
>>>+}
>>>+
>>>+static void
>>>+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
>>>+       unsigned int flags)
>>>+{
>>>+	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>>+	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>
>>nit: either name it pceu_start/pceu_end:
>>
>>pceu_start[0] is the pceu for client0 on start
>>pceu_start[1] is the pceu for client1 on start
>>pceu_end[0] is the pceu for client0 on end
>>pceu_end[1] is the pceu for client1 on end
>>
>>or pceu_client0/pceu_client1 if grouping by client
>>
>>pceu_client0[0] is the pceu for client0 on start
>>pceu_client0[1] is the pceu for client0 on end
>>pceu_client1[1] is the pceu for client1 on start
>>pceu_client1[2] is the pceu for client1 on end
>>
>>... this makes it less prone to typos.
>>
>>But see below as I think 2 samples are not sufficient.
>>
>>>+	struct spin_ctx *ctx = NULL;
>>>+	uint32_t vm;
>>>+	int new_fd;
>>>+
>>>+	if (flags & TEST_ISOLATION)
>>>+		new_fd = drm_reopen_driver(fd);
>>>+
>>>+	vm = xe_vm_create(fd, 0, 0);
>>>+	if (flags & TEST_BUSY) {
>>>+		ctx = spin_ctx_init(fd, hwe, vm, width, count);
>>>+		spin_sync_start(fd, ctx);
>>>+	}
>>>+
>>>+	read_engine_cycles(fd, pceu1[0]);
>>>+	if (flags & TEST_ISOLATION)
>>>+		read_engine_cycles(new_fd, pceu1[1]);
>>>+
>>>+	usleep(batch_duration_ns / 1000);
>>
>>NSEC_PER_USEC
>>
>>>+	if (flags & TEST_TRAILING_IDLE)
>>>+		spin_sync_end(fd, ctx);
>>>+
>>>+	read_engine_cycles(fd, pceu2[0]);
>>
>>... and here we have another source of noise.... when doing
>>TEST_TRAILING_IDLE, should we read the first sample after the spin
>>ended, sleep, and read the second sample?
>
>That would always make utilization = 0% (numerator delta is 0). We 
>should take sample 1 when the spinner has started and sample 2 when it 
>has ended (for PCEU).
>
>TEST_TRAILING_IDLE is only valid when TEST_BUSY is also specified.  
>Maybe I should enforce that in the test. This is the flow for common 
>flag configs:
>
>1) flag = TEST_BUSY | TEST_TRAILING_IDLE
>- wait till spinner starts
>- take sample 1
>- usleep
>- end the batch
>- take sample 2.
>- check_results (expected 100% util)

I think the way the test is written, the expectation is wrong.
By absurd:

1) flag = TEST_BUSY | TEST_TRAILING_IDLE
- wait till spinner starts
- take sample 1
- usleep
- end the batch
		<--- long preempt here emulated with
		     usleep(500000)
- take sample 2.
- check_results

So we'd still expect the same ballpark number of delta ticks, but
utilization overall would go down as now you are ending the batch
and sleeping a little more before taking another sample. In the example
above I'd expect utilization to be 50%

>
>2) flag = TEST_BUSY
>- wait till spinner starts
>- take sample 1
>- usleep
>- take sample 2.
>- end the batch
>- check_results (expected 100% util)
>
>3) flag = 0 means truly IDLE since there is no spinner.
>
>>
>>but then how are we testing all at the same time here? I can't see any
>>igt_assert() for the trailing idle test and it will actually impact the
>>busy test since it will wait the spin to end.... Am I missing anything
>>here?
>
>Case (2) above does not exist for PCEU tests because CTX_TIMESTAMP is 
>only updates when the context switches out, which means we must end 
>the spinner before taking the second sample (or preempt it, but ending 
>is simpler). This series only has tests for case (1) and (3) 
>implemented.

true, we are only reading the value from the context image, but does the
hardware update it only on context switch? What I had understood was
that the value was updated while the context was running. Otherwise I
think it's utterly broken:

Considering
	s* are the samples
	c* are the context timestamps
	g* are the gpu timestamps

	- not running
	| running


          g0 g1                    g2        g3   g4 
          c0 c1                    c2        c3   c4
ctx0 ----||||||||||||||||||||||||||||||||||||-------
             ^                     ^              ^
             s0                    s1             s3                    

For simplicity, assuming g0 == c0 == 0

in s0: g1 == 3
        c1 == 0

in s1: g2 == 25
        c2 == 0

-> utilization returns 0%

in s3: g4 == 40
        c4 == c3 == 35


-> utilization returns 35 / (40 - 25) == 233%

how can we get this right if the value is not updated for running
contexts?

Lucas De Marchi

>
>Case (2) is applicable for a completely different feature which is 
>still wip - per engine utilization via kernel perf framework.
>
>>I think we need to add a third sample when testing trailing idle
>>and ensure:
>>
>>considering the indexing as sample[client][idx]
>>
>>	sample[0][1] - sample[0][0] == 100% if BUSY else 0%
>>	sample[0][2] - sample[0][1] == 0%  -> idle on trailing test
>>
>>and for isolation:
>>
>>	sample[1][1] - sample[0][0] == 0%
>>	sample[1][2] - sample[1][1] == 0%
>>
>>>+	if (flags & TEST_ISOLATION)
>>>+		read_engine_cycles(new_fd, pceu2[1]);
>>>+
>>>+	check_results(pceu1[0], pceu2[0], hwe->engine_class, width, flags);
>
>This check_results will check for TEST_BUSY case.
>
>>>+
>>>+	if (flags & TEST_ISOLATION) {
>>>+		check_results(pceu1[1], pceu2[1], hwe->engine_class, width, 0);
>
>This check_results will check for idle case (flags = 0).
>
>>>+		close(new_fd);
>>>+	}
>>>+
>>>+	spin_sync_end(fd, ctx);
>>>+	spin_ctx_destroy(fd, ctx);
>>
>>if !BUSY you are not even calling spin_ctx_init()
>
>:) yeah, sorry about the readability here. The spin_sync_end and 
>spin_ctx_destroy bail out if the ctx is NULL which is the case for 
>!BUSY. I can add and explicit check to not call these instead.
>
>Thanks,
>Umesh
>>
>>Lucas De Marchi
>>
>>>+	xe_vm_destroy(fd, vm);
>>>+}
>>>+
>>>igt_main
>>>{
>>>+	struct drm_xe_engine_class_instance *hwe;
>>>	int xe;
>>>
>>>	igt_fixture {
>>>@@ -484,6 +569,18 @@ igt_main
>>>	igt_subtest("basic-engine-utilization")
>>>		basic_engine_utilization(xe);
>>>
>>>+	igt_subtest("drm-idle")
>>>+		xe_for_each_engine(xe, hwe)
>>>+			single(xe, hwe, 1, 1, 0);
>>>+
>>>+	igt_subtest("drm-busy-idle")
>>>+		xe_for_each_engine(xe, hwe)
>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
>>>+
>>>+	igt_subtest("drm-busy-idle-isolation")
>>>+		xe_for_each_engine(xe, hwe)
>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>>>+
>>>	igt_describe("Create and compare total and resident memory consumption by client");
>>>	igt_subtest("drm-total-resident")
>>>		test_total_resident(xe);
>>>-- 
>>>2.38.1
>>>
