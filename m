Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9042C5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 21:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2857610E039;
	Mon,  2 Jun 2025 21:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+cM3uxz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6082210E039
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 21:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748899920; x=1780435920;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7n2jH7KVeC4L+99Qf9uyTXEo6I4262SNvcn8aY5a/BY=;
 b=V+cM3uxzD2/DOU+Ss74g23UvLSM8DGKbjnfktBVnzaOMcRI+IbklmYWt
 QtK1YcSRAwp2wPk1M3XJPiEY8odCmnofc+6QnfahEiuBAbCtw6rPeb1W4
 tgncV17III8oa+4zsE40olSnts4IXNHIzpUNU9k5fL0gq8jPQnafcONi7
 O0A1Nf7JMZ5SGSdGpUjoHZYwVstwmmF+n+9T5bGJN43IIV7qC1XIQ7v6t
 eVw8TFSXPB2oJKizZrU/MVXe4q//l4rQVCoOawfFBeZXDHAgkiP8MDNYD
 dZQYxLvRxvvFV9f+1QShGGTyutGd4Rj83OP1IH+4Piaf4V2xQrsnlDBux A==;
X-CSE-ConnectionGUID: vg5QH7W9ToWTQCFVqxYcdg==
X-CSE-MsgGUID: HoRfM1kYQ9q/1EcuG5tsWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61583858"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="61583858"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 14:31:56 -0700
X-CSE-ConnectionGUID: Wc5CZqjkTpC1/3zQBg4JSQ==
X-CSE-MsgGUID: Yru8CdT2QuuIxQweI212ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="145609312"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 14:31:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 14:31:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 14:31:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 14:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlC4CcG8IqNTI/QVz6aVKhF5CF1oOgSkCX1oLGpXg8/EnRKxjCgVFAGPYVLcKDSXxPgM3CUCRybF0qlhXLGwECPwiRB+R8QmETjueJI5PUPYLDIMxf4WCevOJaIjGnt3q4N95ifC1dz0tsM0wVLax+QbKYgIY6JpUhvTfWQnF7mC3w6pvyEv28A3pqaOLL3JONevh7MAVnOQkLnZkcUQJzcIcmaanfV7iWT6nh/dkGEumzcRyKNAqX56iJ2+lEsV6xXFiBfao+KfwNqAs5pGSpYYnpcN4ZbU9Sz/od9UeWxOwornSCvvMKbfBOMAHVZRbyPZodvK3hQeE2Qjt7b5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbCRC465/wjU9t5syezwKyyPZi73LvIhDV+BOrnKAog=;
 b=QktOFDMbpxX06VtU+QwlWJBm5pVOGxxgH2mQrR0RHMTUIPispkX0knEP2FWq0dpCb9oADi52cQhCC9lxiK201PD33MyCQP02JOlclPFJR5aNqbM++Z6K/ZXkdDLDZ7JmplTO9vYAZyVd9nz6Nq3r5q/Fxf/aSw6lZTaQQBnwqjreZjUKjMwupSBKKVXlaTm1krKBE2nJEZLrM99lpgONOl9N3DDdVODwKuGlopE1BsvYOue9IksPHfxv+AHl3NLdCFYq6WmLFA3SWsEPgjYg5xuMJxgm+vGT/O5NXk2gyXmvuWHspcDZdsxqDr0pPhsmwI1Tu7d+elWnq7ZnUj/kGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 21:31:11 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 21:31:11 +0000
Date: Mon, 2 Jun 2025 16:31:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Message-ID: <lff7zesfnc7hvufyjgpx7hwnjwcy5oanlxpj543khidqj6iayw@jy5aqnyw3gnm>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <b9aa7f22-aa4e-4f9a-9c5d-98d58066fcbb@intel.com>
 <0d4c919f-88a1-497d-84f5-25b8cb854d50@intel.com>
 <74ce12fa-b60b-4103-b92b-6f54a3696c44@intel.com>
 <CH0PR11MB5444AA07F3B7B81735949572E562A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <157b95f4-4090-4740-9c0c-48f10661ce15@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <157b95f4-4090-4740-9c0c-48f10661ce15@intel.com>
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 964aecec-421d-4e20-85c4-08dda21ccb5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ocHj9LV/otunwXfSP3gZI4KleuTuOGunZMYxtWH9v8YGgGrrJfkuD80qbho+?=
 =?us-ascii?Q?khgmqx27fW1WWi07HLkYiqtadREhD4hQpzyJZ0apC9br2kZ1NsuSVy4MiyK2?=
 =?us-ascii?Q?NPnbWDd+5aPFgUZnXlmqrtiUxkUQQCw6NsbQdsP1yxvQouuZObgyot9T55Xl?=
 =?us-ascii?Q?AcZTRJbQdNyvLd0WLw2DvcXJI3lJublIrKfs4wV4gca2lSgIJyicyhhYKiCt?=
 =?us-ascii?Q?DNRA9Zgly9iaT7zbP1RIi0l8NAL6ItVpvs3SdU17ODdvoleQRJOTGY0RHcVB?=
 =?us-ascii?Q?9BhQHhlnwXIQX3IGkcFsWwodgkvkm45Vv6H2rh6els3KCUcByZV5WGLVloPQ?=
 =?us-ascii?Q?odOlEzqUKlTqvprpldmOvGaRU/Q2O6rU9u1Qz+/T7CaDiHXWiNk+I/e6sKwT?=
 =?us-ascii?Q?tfldeIcsEU0cnoPdJg3npd8y3MVQWXXSaaCGssR8HicClvoLX2NHEPrW+5gb?=
 =?us-ascii?Q?AIQ7tK+jajRRSFgV/3eeBbc+jDhaYydqXbicXg7zqPQSZvYNvCHxa3LMx2jZ?=
 =?us-ascii?Q?oaEmMUSfi0ufXuZKvXC1ilwgIJnrmW0TLW80MCc0am3yT8peq/0mVbST0D1j?=
 =?us-ascii?Q?8wSFFEmm6NNOltnlRTn+J5vXxT9YdHyr6GqU/0yCHhSwKyXTC9XSOXfGuxnn?=
 =?us-ascii?Q?xiPiuyKPYxeMjwRApbopxHa8S2jn6DfmLmd2jTTBLvMqnRLSnsM3QK8sOKaL?=
 =?us-ascii?Q?SAIyV+G2pyY6W97odaTnbYTiZJDOAaIEfTJBtZuuQ0oemXwpX8YLnnPhbW1S?=
 =?us-ascii?Q?sJfWdiekeSpq9kD7wTzQMG/fUfIn/2BN8QIqNllZl7q64xWbbPWmfVTBRE84?=
 =?us-ascii?Q?h8E1f8vHqd4dFyPanh1yuXFLjEtC2p0gvozDp8Ui1q+1R+0B1uVaXFE4Bm2t?=
 =?us-ascii?Q?7WC2yPxmt59sVf/Auog5FGHLSzGINmC83z9MOHflq8FFMfKkfbSwSOwkdtIa?=
 =?us-ascii?Q?i/F5Eferskzv9/DxEk4umbTEHUHjwQ5xnr7xn8Ykeqtt8BAGU3LWypcu7BeC?=
 =?us-ascii?Q?VHRGgKwdbXBHmFqM4IsYrKIwq+nNLnNsOi5uZTFsEEYEysEKxFxflZqNOwPd?=
 =?us-ascii?Q?0osQp9fGGE+QmZO36TPr3u1PDOm0dwxSFKhSG8t4P+zspCx9EluO6+GT8gde?=
 =?us-ascii?Q?flIL3tjGKOnq6U6R07mw4gQAvcV+OxJmd4wPFRVnfKWlFqy9j/YbuQRgKoVk?=
 =?us-ascii?Q?kAzY5AhUPWzCCXaFbYGdFMKiouD7zmZAmrOv+p5axRZCg5jqeVW7QrgMl3S0?=
 =?us-ascii?Q?qevgZIClmCKZembVew5p+cLmazHIrag005U9wdnDbQhBzfEPYMh26Gu+TFMJ?=
 =?us-ascii?Q?UspwaWuLD36rPHHapLu/6ZWuEXnnGxCoba/3eAktGRh7jQks5s0xO8NwQsOl?=
 =?us-ascii?Q?166NCejb0WUwZR0+97DoNti0Id95cf/H8fvS+fokR68RqMwbOpBeVrF+S13U?=
 =?us-ascii?Q?xAKWthlHVkk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?86bs4qPK7D/2LqWXuM+yGoD3QHMxy3w9uIqGYCh+Ak30mbaeMBGYKAwDr4Wj?=
 =?us-ascii?Q?Xohf1q0PFDnoiLKpUDFXtCuPxlHcBxQ/wDFtbVP8SJCK8fFjv06jHcO2UM3N?=
 =?us-ascii?Q?H9yBucBP3fZRlHB0TMG1RxywPyvkyM2BUuMH6ABboBe0BoFJbVLsYTg6X+bN?=
 =?us-ascii?Q?Ju3ghw7FQAeN1md8PLsneSYjbvP7Hq6r7QvfXdOPAVC3PiFXuCBvMchBbSCQ?=
 =?us-ascii?Q?Dpl4au5B+J9J9e3JonsSyh0n3eRVDHlGvj9X0XJ/HCrsS/NwdF81DmFn9BGe?=
 =?us-ascii?Q?YT5mhhrhROkf58mZWvR9i1Biiyx+urhPpJUMO2vA5nNLPrx7Q69eanfaSvDU?=
 =?us-ascii?Q?S4AAd/FCE217HXz/6SZxsi1vSaUnI3IHPcvnMd4djyiKPdlRmYSZhSbRoTZ+?=
 =?us-ascii?Q?2H9B0n4GraHRlGqIfPDXEYRwPxKNJgyGAccj8IbO1bO5om9YDiZRCACB5UkG?=
 =?us-ascii?Q?fTdar71rmB06KaCaSfyf19w57CkpgJ6sH4aVNwiOgSAucc/iMEb2Yyo5hQTH?=
 =?us-ascii?Q?2Dn6m4pwLR5HlhnyLhfx/meV9JkBUfB+QQQin73y9dC8RjSSB9JtNjhkYTUE?=
 =?us-ascii?Q?FQY2uMHstmE/YoFaqzcRpz7+KmmNAlIK1qfmJeZ/f8lXT008dvEcScGR+lxH?=
 =?us-ascii?Q?tACWQoOcZCMyGCkSskDhkk5Y7p7g7iUheD3YOu7Livdc+63odEyfHt/CDgSp?=
 =?us-ascii?Q?NxUHbb/Oz5nDPEAOx947lkG5VRfUas/ZJEk/qRU7P6Zd+TDbH5wEjkkMrgnb?=
 =?us-ascii?Q?eUrynRkAgHa8P+hV+duu8u+j/8/DQFzRh59qXN50QlMoNG5U/Atw9Irb1o5t?=
 =?us-ascii?Q?fRR77osWYqORrbhy2BTWmcg9Bg6naW1xHeoX5zAtWHP19Z+23ptoNy19F4TF?=
 =?us-ascii?Q?VhAU7zvHla4y712/1Xh2vjA+VqY2LoWQVL1jjj8MxrmM97E6MYlRqXgESoke?=
 =?us-ascii?Q?5DKi8U+RtfMsqmdfUrzZb4RarapK6ErSQTLbyi9Td6omoCcJnYjopZ1sygY/?=
 =?us-ascii?Q?arQlxwFz/4gl5EQTsFIex58x4d0XRWW0ah++Wt2KOxmWGbmc2Are7Ur8N5q2?=
 =?us-ascii?Q?XesVhyLM025xkx4R5xUkhRq/iGdJ1CYla780g2eJny9yup5J4bgRIFdIFn23?=
 =?us-ascii?Q?ohVBh/r4x7b9g4R+nXvax/UK/UjiNBDgiEEsNBjb93J8YGz+/VroX/CIXI2i?=
 =?us-ascii?Q?R5YIAQgpJE1VLFPepSRdUVi/eniy7UN9oLpE+jayf31P+cMsQ+C3f+cpTzmL?=
 =?us-ascii?Q?KqESGxHi24s3Qye774lkK60uUxT6cw8yDcaDV8yUTb3eQ8ytbSRk1HByAU32?=
 =?us-ascii?Q?YrREpsTQIpOPmhRrsczkiDbgPCV8AVGM2R+5zUgXmy19pH5vKt8AiapzFB8x?=
 =?us-ascii?Q?WCEFrmTu2buDZtlj27IP8jg6ycrBMrh3C2NlLx1z+n+YJUQzYBLhOhbqa/Of?=
 =?us-ascii?Q?yA2A6y4z1rELhsb08/9o4eB54KeO2vltpDzDlJulwfr+RG7FkgxCecYEOAFm?=
 =?us-ascii?Q?ylrsO3tAEUeLRfjw1bR43H35o05tj9OBtfFZC/ocYO78kcd+EClp4oZe8oha?=
 =?us-ascii?Q?FFt3qKnmLbKPkEv67vdSCBMWMDJvtYRbHH0I79GdFZpmpupzrcEzy89VjFUs?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 964aecec-421d-4e20-85c4-08dda21ccb5a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 21:31:11.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONyKfNDGCKwiLh43C+vb8yCteSHGkYcZnAmZxBJslIpfBXtc9lgusvm4RoW26qwtY9QwIthRM+BN7Nrsqud6iGX5R7kvN2RUP7KXisNwwhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

On Mon, Jun 02, 2025 at 01:31:40PM -0700, Daniele Ceraolo Spurio wrote:
>
>
>On 6/2/2025 11:30 AM, Cavitt, Jonathan wrote:
>>-----Original Message-----
>>From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
>>Sent: Monday, June 2, 2025 11:26 AM
>>To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-dev@lists.freedesktop.org; De Marchi, Lucas <lucas.demarchi@intel.com>
>>Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
>>Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors while injecting fault
>>>On 5/29/2025 1:29 PM, Michal Wajdeczko wrote:
>>>>On 29.05.2025 18:23, Daniele Ceraolo Spurio wrote:
>>>>>On 5/29/2025 6:31 AM, Satyanarayana K V P wrote:
>>>>>>Currently, numerous fault messages have been included in the dmesg
>>>>>>ignore list,
>>>>>>and this list continues to expand. Each time a new fault injection
>>>>>>point is
>>>>>>introduced or a new feature is activated, additional fault messages
>>>>>>appear,
>>>>>>making it cumbersome to manage the dmesg ignore list.
>>>>>>
>>>>>>This new patch automatically ignores all error messages from dmesg,
>>>>>>eliminating
>>>>>>the need to add or maintain a dmesg ignore message list.
>>>>>This would make the test almost meaningless. If the test finds an actual
>>>>>bug (i.e., an error we didn't expect), how would CI detect and report it
>>>>but how can you tell upfront, without actually running a test, which
>>>>error is expected and which is not?
>>>>
>>>>>if all errors are ignored? The only situations we would still fail on is
>>>>>when the kernel just dies.
>>>>and that perfectly fins, sine we should look only for BUG and WARNs, as
>>>>it's quite natural and expected that once we inject an error, the driver
>>>>will likely fail to load or proceed, and/or may report some error
>>>>messages, or even try to silently recover, *but* it shouldn't ever crash
>>>>
>>>>and that should be taken as a test goal, not that we look for specific
>>>>error messages that could be changed, omitted, replaced by the different
>>>>driver release or when running on different platform or function
>>>The patch does not look for WARNs though, it ignores all errors with a
>>>"*" filter, even WARNs. I'm still not fully convinced about ignoring
>>>anything, but I can understand the POV of ignoring just messages with
>>>the "ERROR" tag, as suggested in the other replies. I'd be happy with
>>>that kind of solution.
>>Huh?  I thought the alignment was that we were to ignore all messages
>>that *don't* have the ERROR tag, not the other way around?
>>-Jonathan Cavitt
>
>We are injecting an error, so some messages with the ERROR tag are 
>expected and should be ignored. The question is whether we should 
>ignore all of them or keep a list if expected ones and ignore just 
>those ones.
>
>We definitely can't ignore warnings or asserts, as those signal that 
>something is going very wrong.

Agreed. I think ignoring all **errors** would be ok: we don't want to
babysit the error messages and draw conclusions from them. It leads to a
lot of maintenance and even the odd situation of a typo fix in an error
message being flagged as regression.

The warnings we can't have already taint the kernel. So checking for
kernel taint should be good enough and I think we already do that,
don't we?

Lucas De Marchi

>
>Daniele
>
>>
>>>Daniele
>>>
>>>>Michal
>>>>
>>>>>Daniele
>>>>>
>>>
>
