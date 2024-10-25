Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CD8D149E8
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 19:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA1B10EB7E;
	Fri, 25 Oct 2024 19:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqpcYCbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C081810EB7E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 19:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729885918; x=1761421918;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GdWjyT/KzR6J2XuSrPQTv6kdSqXlsFjJ03fb6tnMjFQ=;
 b=PqpcYCbKtxH3c4k45k+7DgnVi91DTWS4QQEfOXpUqVaHyNGoBiy0vHom
 WK4oB3vxiU+dXNjevSa7Ekno+z2QQvwBurGfjtdidf0Z/8/hH2u/5rC4L
 S7RCFZxnKmDtbPS5XFbPlYExC8ItkqIp95qicmKxeMoIhhWgjPZMXdvLC
 LzQTI457L8qjvVD0xFR0BmDwkWpn/qG8cL/qQfGk7RXz9KGbjerYk/J/U
 zVfes8fTtzprKrhCVbpj/2RF512w6mKvvZRqAa0GWNNt1KA4wuiWB0rCJ
 7W+oaJHzNkq4a+o1ksxC0sE8aoK3nky4BwM+9OBWgl1krQdhQhLe+j6r3 A==;
X-CSE-ConnectionGUID: dWssmQjuRNKU8dsD8w1mOA==
X-CSE-MsgGUID: DFnnJVHnRUiG9tNYifiRBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29432881"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29432881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:51:58 -0700
X-CSE-ConnectionGUID: CtB1V+dDTuO4GT2v6CFXyw==
X-CSE-MsgGUID: KX7JHcJUTmmAB/9GxR/Uhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="104332702"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 12:51:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 12:51:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 12:51:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 12:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpgQnZ0sJeIi8akF+9y3TuDZE9X1xl0u4gYG207dih8qQ4wyDFd6Q+MOmLXpksN+bgPIu7AHL+HJdZc8XEuBvUbbbhqCnP0fAGahmxXOeEiuK+ohhlFsd+ZYqyFL0JW92GF4SWql/ifcG1icgJin8lCwVTFkKbOq1+YINFrdO+lFeVf/H6UVJnXO2rnAvq9Rh+CwVaSSMwn4WUHczWU1fopeANEN3GBxCZm9dEK4uI5CEwlct5vpHan14i9rFIaoDm+Q5KbTF1gWYG6blaJejZwDxPBNuzajhyZiCGWU2gPxy6FbR0/lxF5UqTXtwGZ0wETuSJ4ZEMSv8FXvGo4jzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QecxVUUv13rNnrD6avVATpWRlI6zl9hAIT5RqPexRg4=;
 b=C7rHtpQYymODwRpyAC+C0I3Z10vV5Xh1G74XsXZ01aig3/WlM6zcKtAYwLVg0C1HM+svtjOYxpRbbEITIXKXYKh9TRFBUkYKaj799OdqPjmV3NEkYLsDT6V+6dTLhYYt78l8+NNYsQJ/U9Othfy1VzS1pRBLtAshNWCkBIyzPSNKVt/V+PesW0udzv23/iLawPCV6+dLiTpe2XU2o/qhZxIayV3DFFCslizcq7WaJALiI1/M8A8i3KEX3I2lznP/OVjp/e4WFT6ZbpixAy0f5ap4UnMEnwWB0JkPIJxv/+T88onFnJbGqL6O2OVIGy7Ilqm0jBGY0jplCnxq8nzBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 19:51:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 19:51:48 +0000
Date: Fri, 25 Oct 2024 14:51:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel: rename drm_fdinfo into
 i915_fdinfo
Message-ID: <7t6i7wumxqblpxhix4fmjvtwbmyermieffld3nbbnorqqzsgr3@hsj5zf6wcbub>
References: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
 <20241023164537.83876-2-kamil.konieczny@linux.intel.com>
 <Zxvz+a/5Ko76v3wg@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zxvz+a/5Ko76v3wg@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0348.namprd04.prod.outlook.com
 (2603:10b6:303:8a::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: 3985784e-674a-4434-1bc2-08dcf52e767e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/3CbphX6fOj4k5KDqdYOpHJUq7/1a2jS0dTtiyZiqfKmKpAeKpbO9PPfNFgE?=
 =?us-ascii?Q?euBTWXToo093xN6Myds7HvyKrDiLOxgIdkaapP1GvHqW6ssY+D/W5reHvA/b?=
 =?us-ascii?Q?KTNQF3owHneusE9K3qllZM5WNEzueNu+8CzBmL2I4eKnS+DHG1iV6XhniQzS?=
 =?us-ascii?Q?VVfcKDs0VhsGJPWHGqujE3L83yiEg04lJUynZXBDz+WjSXo9T75Z3lRADPFc?=
 =?us-ascii?Q?Qc0db5ogbBuK2zNnH+se6igodeP7iB2vi1OEOG070m8GWD9nngtdMqbTOJ80?=
 =?us-ascii?Q?49ga5FGZeRTrJZNEuT3W8pAqaz7/xGBDXjhMI3+F+a+1laKg03ZXJ9ZPie1l?=
 =?us-ascii?Q?ApmmDdCBQB6e4H7sGx65tWI+UPBO72lBDvNPUPKhw4/xLr52mYJ6qAyOu182?=
 =?us-ascii?Q?ydpmFbbR2mrKf6o89JJucrubzJl5lNMKRirusFuE6NprHbEOccBTm6iUwwfl?=
 =?us-ascii?Q?+wcDkl7EDcA8oU5cp1RF3GKs5BulzEA38Q181fVRPNiwLbZsszENnDwNHlMX?=
 =?us-ascii?Q?pObe0Uz/0/Rj6nwQntv4X+pVrJHXI10BuXhXr5rsuO/od7uphi5kF4EHXh/j?=
 =?us-ascii?Q?64JFbEG4xsidqDZyF4pe3ckFKdfJd0a1WA0++NlIinlABiAxs+PVPKy7zzlB?=
 =?us-ascii?Q?LRXwwhkmwG3sSbWUtDD+AmKO+s7qFQohSNlprBB2EsmpryrxVaM2sp3e2yin?=
 =?us-ascii?Q?l+5nBDT8eSVd/JM0qolXLvot9/fQd1zbAq4pcNlWfFLuii8uHv21DOjdOfcp?=
 =?us-ascii?Q?6qgUrsiH3VQQeIertPbDfr4pzEaQ95kcPZzJGp0EHh4bUCzl3z9pLUJLZ8kT?=
 =?us-ascii?Q?acXaj3rkOaBhagc88YZ/cJ24o6YuyBZa3pU3K/bwEtCcQPCTfHaWoF6eGmFk?=
 =?us-ascii?Q?QWmp9oNHwY3NVNBNbDXA/b22MmcFviSlPopZQjSqrkcfOkAOQWVzM5F4Pj0r?=
 =?us-ascii?Q?KV4GPQqvZP816qFlhC2eAt5c3XgmIEFcJwthiyx1z6/f8YiNAvPTeAnbNw18?=
 =?us-ascii?Q?ImWtwCJ4R+2z5d0fG3Pt5c9lEWwuZkKEcs9il3w/NXwVbqoGmUjDBKoLFq76?=
 =?us-ascii?Q?RqGjCEBbVvEfSpGY+paZz4rcHq18ZcAaYijee0Ui8I8Jyrvw94UKKCbIsDEP?=
 =?us-ascii?Q?+EOA25UsQyi9ZbtHXnctosXK9ZHTb32o9fUIlqhVaSHfs1Uof7T0A/jhRJdI?=
 =?us-ascii?Q?mJUBUzYUhCxU1JuDQy1BEHdoEtyskKkTzOBxljBmyxEtlseydu/6exlrVKjR?=
 =?us-ascii?Q?PLwF5DHhVg4XE+9Doc5D0u8ZmGyifeAksnrOd25lNmneRO5Aj6FgOpqlrJa4?=
 =?us-ascii?Q?3so=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UOc3Kt13tYCViankW1/Gjit47/VmhbAl6kyBCYj9YXDzxtdWGi4APvwsXSal?=
 =?us-ascii?Q?2Hb1d3UhJ6ALYW+eR0hxlRCKKS55gFdruvJFaFXUjjSnyS3w3HUx7TlyK/g3?=
 =?us-ascii?Q?OUoH+QykuktfGNtrXJAT4rUmBflYNoEous1zm+CAOZwOOktEg/3MnU2Q/HgZ?=
 =?us-ascii?Q?9H0XJHk70xW0QznZsbIvEhq994fqRRLpEzPGrbYsSNEPpVqKSUx5OraJwXuf?=
 =?us-ascii?Q?JiD2/KELcnwksvzvfprFeiplIu5QyokbZ6y8bjXS71Oq5j5Z9b7e1cJCZAsy?=
 =?us-ascii?Q?BOfzmUHrgnYgXesVmEgKzW8zQiKjC6j/5OuZVkhDzulnKM7tasiGmOCx4ub/?=
 =?us-ascii?Q?frv2AYfRqV+hbtxlfklnOJ17GONCgwQq9Komd36+n17jThJNlHLxGeqBghgq?=
 =?us-ascii?Q?liiUa/H77HLHudz+UWhY1lvSLqRylJHFGJrj0BwmZsfF7MIbMqxJ40gnqtJS?=
 =?us-ascii?Q?tXwLLkJq8n27oc9W57BGh9+uZTwYSGvjb81lVdqNaxcsy2m2uZGPwE0FO1XX?=
 =?us-ascii?Q?Zn+oCFyvM3bgMDClganSBKoqpLzPrDubGWnq4bY+GgSIsHK9FU5YQULcNHL7?=
 =?us-ascii?Q?Jw76nWpNcxyTlUG0f6BilrfJbejRWG1SlRXo2BsEBDpfSfAPWTdB9+2wMBM9?=
 =?us-ascii?Q?hEj0mpohE48Fszp87L30/3yxbjPKIjs3wtLHjDnVYNWdE2WaPGfNvNTtsn2C?=
 =?us-ascii?Q?hoVKUVaTq/vlYA0sHN+4NFERxj7C+QXNau8q8vfqBUbjEhF9sd3uRe/P3RkA?=
 =?us-ascii?Q?s9HJoXoNAgj8seFg7QLbiQwvgBd+ntOMFYonFNgPjbafZd1BbgSIDaxJALgZ?=
 =?us-ascii?Q?jsWfeitnyYZvfuBruWeCIdD1N/84TaQCDbLLGKCyIO8DRxtwSrtM3PI28GO/?=
 =?us-ascii?Q?zG0v/nilLna7h407YpHQ8JrKjG0kH2nlMwyqjgLZIsE4KjGLRrwVLQpMRPHO?=
 =?us-ascii?Q?cBsz/SIe0GlsaZ4lNOeIJPclzRwuWRF3f8Ssw+igGETQCK+GeUlvFLz3hN5U?=
 =?us-ascii?Q?EkhpBCpvR1erx/QhSaAXH3LNDrSC5POw2jIAwhbS2ERuvpnodJXX2ZiXDvRZ?=
 =?us-ascii?Q?GN2KgtF1y334O2tcLFPvvfVwFyWG04bbbfNdVPzj7iNJqwKgsg0BSuyJkbur?=
 =?us-ascii?Q?AHKLohn6LyiiufvniuyQ9ZbNRJgtnLB2XUhee9YyElt29RySTjfW9063d3qS?=
 =?us-ascii?Q?+1IKxhOdS8mL33L7umA2dWGGd2GR+wxSUWPjbWunzLZMZdZsntMyQMGjQQOg?=
 =?us-ascii?Q?KV8XL65enbhOV3kBaXBWWpiRl3SxGfaD63SyfjCI/It/Uy4DsFSzwRatBrGp?=
 =?us-ascii?Q?69eTA1jymRn7pYlUwoppO0uy459rux+qWR/HqeIR5W8xCec+cjxAOE45sjCI?=
 =?us-ascii?Q?WXx4HLoqwPwiY+cpYZe68NQ1hyt+KqBSROfBKKk+FQ1RrBfDA2n8AiN8Sr3N?=
 =?us-ascii?Q?fjy/hFM3iKiSFH/3G1QdyF0T3QJPRc4hAIUf0Lvk48JQRIX3NIcL9mBdcP/8?=
 =?us-ascii?Q?ACJiC0cgzWOa+CQ+HS6FAavk6lVIIXc7o6HWiz4pyONtFPDffu1SpOf2WUHE?=
 =?us-ascii?Q?sJGU6iGd8zx+1tYvLxEuQTq99iRe8OsT00eMZT56uGtlT2/J+5wjSYQbxdCo?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3985784e-674a-4434-1bc2-08dcf52e767e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:51:48.6204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5O097DzUeF1Xez3V+8OnbeoIe2lVWTNmzWTyvFlmVgr9Ra+mk1sgJHJYiO/vBTkSibQCZMWpcWneGU7Ut6WIs+JFV2UHchxL1PQj9RzYiRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
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

On Fri, Oct 25, 2024 at 12:39:37PM -0700, Umesh Nerlige Ramappa wrote:
>+ Lucas
>
>On Wed, Oct 23, 2024 at 06:45:36PM +0200, Kamil Konieczny wrote:
>>This test works only for i915 driver and also uses i915 specific
>>workload to validate fdinfo so rename it to avoid confusion.
>>
>>Also while at this, sort out few i915 build names in meson.
>>
>>v2: correct Tvrto address (Kamil)
>>
>>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>---
>>tests/intel/{drm_fdinfo.c => i915_fdinfo.c} | 2 +-
>>tests/meson.build                           | 8 ++++----

running a grep to check if there are no lefovers. I found one:

tests/intel-ci/xe.blocklist.txt:igt@drm_fdinfo

with that,

|  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
