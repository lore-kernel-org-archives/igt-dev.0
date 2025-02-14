Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A1AC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 16:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730FB10ED04;
	Fri, 14 Feb 2025 16:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAhc7FHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C1D10E33D
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739548995; x=1771084995;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AeeHcC0XpJphUkY6a4G1hqSJfaEctNQYbx/fBYgTNVs=;
 b=iAhc7FHNwTgXRigAbr0993UH4dJXq8V2nQnRLkbt3myprpXDd/R+CphP
 QsDodSu8HC3H3Kov15zQO/eC7NOOjDTr1HhGFd6jPT2q9kS8BcFF4YXrK
 GGkv/6H8bu48KgxmTOhQwaISjbS28Vd4ueke+AqAu701SGqDi2iSB+8rs
 ELLnBpqmiNmX/Ay27KlAUSYo7alZnZnm+fZ2bEpIMnCc9xD9y01aMMSCj
 JvDBdJNE3MG7WdLQxB1Ar7kzdArTBKyT8khQXNh/xwQxokMyqHMRE5fbo
 N/5XIk3yGX98v5CM4s3VocjKzIUIdfoa36c0r8g5Zd5CgoF39kD0XwcQ7 A==;
X-CSE-ConnectionGUID: MmyoziPXQEKloO5r4DFtRQ==
X-CSE-MsgGUID: IQJ3q70pSqyMC59Jhzx0lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40444703"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40444703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:03:14 -0800
X-CSE-ConnectionGUID: y5Bfqdn1Q4K7WwBJDq5WpQ==
X-CSE-MsgGUID: +eYHGCBvTIGl/pyo/BbnOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118693529"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 08:03:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 08:03:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 08:03:13 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 08:03:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEpVJ8R6XOpePnvjH3H1T7CmaZ1fPL0pOQiuT3uV1bvtmM24iOjtFvb6e9qfxuEcyJbEeiGD2viGg2ekRGFge9SiNbhXII3dxCyc25tRkvrELDht7PBt4vb9OHJ47WEDlAd0UBdTy35O5Wss1pKm/uy34+wUjIukeX2lCdlZ8BVVECbNaWaiVUz4lSuF0BOkT9sXWZt/Qjr9Qch2y9NyQ9w2AbZdmDTnkv+VhekLUsPbyxRtQJ0D2xUATpstHj8BPteyY1uGrzqqybD9Cjt5upKk27o+W9mkJU0fK54mYEVJ5O1WOPDlNtw6wfBR85ioUTbWBapttV1gqOT4EelCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGRH9Kvi7MNdMMWSkGk5oT/UpaYMV7GEYtryvEofsJk=;
 b=Hg9GPzgkLhC5/ZhkVh/ZF6HEksSCMtKDXL19SecHXYeYOjrt6USk2DNjdwgW5lIVp5HiW79vu5CRHK63IFI1w7Azao299tLgcp2AjA7EZH8dAq0Vd1JTD7gwT66zTCvfBZM9WNPdtWSwqhpTGEq1WC2Y3NfCad3dV/vPezm0RM2V0OOSTzcaA5InJ2vximF7GolMRuqz01vznhPb6mDBEf/lnWSWp5MOxA/sMrHlQKp9b+9qAxOmlH0pOgSvHEJmAlmqSwVxj3afPT7Yv+R+rWOTJ37k7HGyXtMNEwYM2BMPObp0VjtWhFs1xm1mQayy9h6wNVxTWxQp1KuR27uheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 16:02:57 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 16:02:57 +0000
Date: Fri, 14 Feb 2025 10:02:52 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
CC: kamil Konieczny <kamil.konieczny@linux.intel.com>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test
 category' from documentation
Message-ID: <qot7ejqrgw6n2goezmvfmxciff6pjbfhxc5jft5f4l4iwuvfhc@t7iuxbh2duj3>
References: <20250210105646.307902-1-swati2.sharma@intel.com>
 <5mwzt4z3uhjdsohlym2366irc7hqbidufmymh7dasmzkg42hi4@7b3inieyxliq>
 <0302d77a-2202-4c8b-abc7-800ed84b1141@intel.com>
 <n3kyty56cmjqniby7uopeiklhzapt324sxnlhahkmjoelrpaou@umqhk2lztir3>
 <53dc7f0e-7ced-4a2e-85d7-ae2a39967d51@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53dc7f0e-7ced-4a2e-85d7-ae2a39967d51@intel.com>
X-ClientProxiedBy: MW4PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:303:8f::35) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: f349b0e3-2c47-4eea-f8b7-08dd4d110bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CjdSDmGkEwRPnVnceAasPM40yttb21Dd5jcJHuntPAzAxR/LzjlX4fXsuZ?=
 =?iso-8859-1?Q?5VLW4cxzGkGafWATCHXxzUGUIE2prvXBygIjFBaA34wfanMQTXymqfIWHw?=
 =?iso-8859-1?Q?xTjaOuEd8O32tYl/zUdAZhUY8uWmSP2XlHG/dNzWS9dFi+/a8NKkpwrrGd?=
 =?iso-8859-1?Q?kiTG4SfoCqiBvUXYziHo+sS0nCfUDQtakvkBcfqqoT1k2lQ8LTGDUthi4j?=
 =?iso-8859-1?Q?Q/HJIq9L/SRdSRKv2srzw7uePgOSK7Iii30ruz4Fa1hs2PWCfXXgi3P9ME?=
 =?iso-8859-1?Q?edUK8zwVsMg+pCgSJ4CvE/g423I+rxJdb8aIaVKJNjOdSd9DjZgd83pZB4?=
 =?iso-8859-1?Q?q0sPaSqFPEayofEfE3E37XCU0YvhtwAkRz/e27EJ29rgguVearc+Ews7RI?=
 =?iso-8859-1?Q?aJVkYVWfY6UByU+t9P++VNwn41M8RIXzI0XfJIylUt4i+Gn2DfKGT+E4dD?=
 =?iso-8859-1?Q?7auk8AwHr5bTVClgxqMWCLZXouyS1nHyTvo5466ArCWIKOFhmD1u8I+Aqm?=
 =?iso-8859-1?Q?XFoVxkHTgZhFIhBBj10N3JxdHYsr50CkCn7q7hj/PUeSUDksdnsbZ08OV4?=
 =?iso-8859-1?Q?wGQVZ38GS9yk2+h0YQOlOAIXSIw7+WlBMzVlt5LcWaSUOH0wt3p3RuxWTG?=
 =?iso-8859-1?Q?uxhG3JfW0ZVg1UFQyfTfv82zdzAs1jPa3kLUiRQ2cnSBHtGcsxe3SghgRc?=
 =?iso-8859-1?Q?D4hKTOFfT+9/AWa0sHKgBK39si9lPQue8FTbO2mewHU+/jBifyjZ1U6Gqg?=
 =?iso-8859-1?Q?k0KcpvGItPInniPEr5lIt+UUN6VWkn8xW+D9eHeKR/E7MgE9n258wbDaSf?=
 =?iso-8859-1?Q?g+/RcEtsXNKkgxl5/eyBwwlzufN6itLcbqGDQJb7jISpZzOSVMjC3DZF76?=
 =?iso-8859-1?Q?MQGtoBXLPVqFQqciUBBR4rCGeHDi4juFIodQxYqkC1fAqbynjWZMBSdK2R?=
 =?iso-8859-1?Q?ku4hLEx25KoAa7zEqe/0pydJNtqw720UHp363TG04Bc4j3qD8K9sKEJfVr?=
 =?iso-8859-1?Q?4FB5WFOuKoyA1yUHX9bFXZOX24COQ7GKoxSmZWxLVRN72Z5FT9+OtrHcmT?=
 =?iso-8859-1?Q?6Nds9GuZEb9sTTyc/DlpY8OJWV6bv+n595Ww6534XSCfdhhs9Nm1PDmWIy?=
 =?iso-8859-1?Q?ZEv7xQXqRnwB0YWuXUMnv1j0+yqWc8NJs5aTE7hlJB7nMGDc7yvO8VytI1?=
 =?iso-8859-1?Q?BxXbhiUYc8eJeSYXiM5ZfRGfpu72tdgiKbvxCYKUv06/tl3EPms+olHU2G?=
 =?iso-8859-1?Q?PUlezrAaivmg8jC7glHnQvqei4fguwh0DQm441Q+grJBr2xHPoXs5H3/Rh?=
 =?iso-8859-1?Q?EXki5SF/pWonA50dWGXJcV99sSmEpdH5aKNMf5CcdUpSLybZq1uXnZqPkR?=
 =?iso-8859-1?Q?2g4PE9SLjOYlsO1ZlQd0JkpGi/7GqmKyxluJnypLrjtZLnMtXlhyBsdmk6?=
 =?iso-8859-1?Q?tsGfduVPYUUDlUCL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oRzvs69OaOJFO6indPisW24tqSCVwNHPWJC/MJwh+mLwnU+q3lLoa5VdH8?=
 =?iso-8859-1?Q?4bk61PIPpYQw0DC+U+8n/wjSJpQautmOB8I60SArsBMEwqj3EXujFt9eHF?=
 =?iso-8859-1?Q?/TessC7cW2L6L5bFXtjjA98UbA1Mp+8mgD+fOxn6HMg4GVldEntdfN/GPp?=
 =?iso-8859-1?Q?rfJ6E0mpmi/Vud2AVnCEgZ40303GNHRCIDUi2BBnlijjwQbHq4WkdOxvU/?=
 =?iso-8859-1?Q?QoGym0XrcefRTgdTO0J/DOMKUXUiQi6YuZGCqaxFwBEVhd9aVUkUunoBOs?=
 =?iso-8859-1?Q?vzkfZLdLoO8V9hIk7DO63R1aVISOiLNl42XZToYANw0AWspsfv975FwQsX?=
 =?iso-8859-1?Q?RKJ1OVH8zK5DfTgD+F43l7Hp/bRfU7V+67JjN/f9nXolm1crzg17JxSPJ1?=
 =?iso-8859-1?Q?fKtwJpxEZt8kdScvoY7E3neC/KdlGad1/4BjxzC/SspgNMZ16w48IxRcyx?=
 =?iso-8859-1?Q?zS4dJaIpk7ew+xbXRuPjub3Ff+Tnv89o2gKGpQTjJrufuPANbEjYgaN63m?=
 =?iso-8859-1?Q?kb/hu8rMmCg0qL6ArVhFhrQvIjmKuPueFPzi6V3oQ269J6N608OT0sLbx5?=
 =?iso-8859-1?Q?vWZlcn6wojwMKWoqrc3l4V2yhFc+yR0jLlOknF0hpC0M7/77as2BhP7JDS?=
 =?iso-8859-1?Q?5acZ4ec2tc4Ot3kpOn2kXXyRnrjcJoqz8c5AX6zjNSfQ2ULqpiioWMOcWo?=
 =?iso-8859-1?Q?UIxb9LmVkj9qY/dk5A7x8QVDarNd0EgNcl3AVfdGalcAzy+NvRYj0aZOgS?=
 =?iso-8859-1?Q?5/jljplOdbolPi6+rtCUs6/hgUjSta/CeqMv6bt87CRu+jE5MivFOh2l3p?=
 =?iso-8859-1?Q?uwIc3fPlefZ00zkm3vZjxv06G1Q7Q42xfhWMh3NKLrUEkSQziU1q/omvF5?=
 =?iso-8859-1?Q?rPIHo/V2YondgDOeSxOvpg/0NhNYLsqFA0ipSgbMwiNFr++lBLZeCJ5T0S?=
 =?iso-8859-1?Q?Mv90yn5Q+uWUb1VHCDDT8WwCCaUGI4Vpy1Tkj0Br2fU33rVkAzfmAeSSkj?=
 =?iso-8859-1?Q?vS4v/tLJKJLcTgzvMCRnwEY2h/FGURSJX3z6popkIbHcAaN+38xAvGPsws?=
 =?iso-8859-1?Q?haPnpIP+BXWldytU8Uc2ph3q4iozZvYw773tGo7YGYWYfa98zRKq1+uJVj?=
 =?iso-8859-1?Q?behR4sUyOOW465vJAHN9E35xPMdYZEjgKjy4GOihnON+r1A0pP1/UFX4z7?=
 =?iso-8859-1?Q?Qk+9XtCzHf8gODr9StxtoiWg8tfQHdfqDVuVvPLNbxzNV0U0Q5ywPoc3e9?=
 =?iso-8859-1?Q?bAtISJgMl9rGa2HoUEmv/Rl9NTN3rqqesRCvywov+Q6OGXnd4jHikVbkBm?=
 =?iso-8859-1?Q?n4rkrdWREEIJElI5VR/DSuCqNQ+v4a7GzS5r1b9fg4dtdXHqKQsLa1n6hy?=
 =?iso-8859-1?Q?17iXsStlhdn9cFZ3B1j+NXb3Oktzth8PLUMt7AlVIPWxEMq4HBMaG30u4f?=
 =?iso-8859-1?Q?kVwFd62mdJ2kGQmfDSvy4anLLLH3tElDf4i9HuMekq7LEtqrrKCg9E369k?=
 =?iso-8859-1?Q?3J8XIIvRoqr7QrGQvCEl2luo4SC4XpM+JxfxLZJP1LdkFBKuyxbCOlAQYL?=
 =?iso-8859-1?Q?pNlGJUkuOTcWiHGZLFGnuWMCHGuBCor0PSkuMeagbHUHBVsF4Luy1jCwxG?=
 =?iso-8859-1?Q?EGRx83UEIC5eNnJ+BLkE3BpXZgECPRgK2mgvGQ3Mb3gXbwTWKPmorLuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f349b0e3-2c47-4eea-f8b7-08dd4d110bd0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 16:02:56.9520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+47TK8wSMJK6McT8D2SGGo51dOoGnJuHxG75LpaLqkQpWaL1EsSmmux5X09IkEOnauiBd+rOA/th6BVsUwAJaq3ZLgaPkh1kBXMZ1sZhko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
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

On Fri, Feb 14, 2025 at 09:23:44PM +0530, Sharma, Swati2 wrote:
>Hi Lucas,
>
>On 14-02-2025 08:22 pm, Lucas De Marchi wrote:
>>On Fri, Feb 14, 2025 at 01:04:55PM +0530, Sharma, Swati2 wrote:
>>>Hi Lucas,
>>>
>>>On 11-02-2025 12:55 am, Lucas De Marchi wrote:
>>>>On Mon, Feb 10, 2025 at 04:26:46PM +0530, Swati Sharma wrote:
>>>>>'Functionality' solely depends upon developer's interpretation and
>>>>>'Test category' is not used. Let's remove them from the kms tests
>>>>>documentation so that documentation can be made precise which
>>>>>is easy to maintain.
>>>>
>>>>but is this needed elsewhere?
>>>No, this is not a mandatory field for KMS tests. No no change 
>>>required in json.
>>
>>let me rephrase the question:  you are removing them from kms tests and
>>not from other tests... so the question is: can't we remove them from
>>everywhere using the same argument you used to remove from kms?
>
>This depends upon core folks, KMS and CORE documentation is different.
>@kamil @kaisa any inputs here?

Ok, let's check that and remove it there if it's not used. But even if
we can remove it, it doesn't have to be everything in the same
commit. It's good to trigger the conversation nonetheless.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
