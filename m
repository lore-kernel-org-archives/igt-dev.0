Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9659ED46617
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 20:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5E710E09D;
	Thu, 15 Jan 2026 20:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOvwsZ9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CFB10E09D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 20:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768507679; x=1800043679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BLJkDZfmTVlrzLsbsbgfIZe66iwxjLsYCo+x12magcI=;
 b=YOvwsZ9I/L2tM2dNea2Oc6yKRWV81XSQs/fz9J6lfR9JktKwvgPG+gIF
 XxVAMoVV3PZ451eJsBIW12S2XrPR4a/KGlQriR+Y5+4atgnBSz1jqPoAj
 aJPF7OzNIobCtIS+9uqjBdSyR1vSAM+RB+8nJPYtS0kQ/I5cI/QbJw+Fc
 l4NcQO3AGXglSUkGMMd74gwipolvUGe4xeb8zsFcLlSEInWezmZN/dyPX
 u9lLqHsn87rBPXB6fMuoz7P3dmffBFqzIyfRgmaGDVwb0PJ/GKCAtq/Jj
 JlVsxIoI+RGepp0ESQBDcBjkize8P/lLuwE5PylCN1Z5rpv4huRrWqSJZ A==;
X-CSE-ConnectionGUID: ZotvjT0xQTyceE+QaQBY6A==
X-CSE-MsgGUID: kD7nAWldS8GCUf46vB8yFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81187665"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="81187665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 12:07:58 -0800
X-CSE-ConnectionGUID: BB6TGTsITuOYXAhGH2niLA==
X-CSE-MsgGUID: eZq8fPZCT6erPwbhIoi6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="235741653"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 12:07:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 12:07:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 12:07:57 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 12:07:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVnt1Kx7/8BCZUJf1Qo+QB7iDPW+zcKmnPeqtM2YykAGcS7B5AQ6cbTp7c/UJv/brz9aZ2oG4lB27aDyLw9aDzS+lRsB6AjKz7ZdCUkEDAQy69AN5ppzVf8ihpaOKRxJE9VTP3AwudTR8N6EKxvK+aG3i4eHczuAyeydV+rVkNmcHUbOPlc5xwX4+WVm+MXW8Ez57QknY06npcCWQ1l65OwTrKqDg7sK5GEeWbMEfI0QJIaA3mTIKyxliI2PWjooz4kV4gwryEsAWxdN+2AbcWvtXh+gJz5Lmowwz7c0uDogQx+Kgo/f9skKCKWPnt6QBR48O2CyuUVGFDyLoc4xxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjVRkvByahYuWeStx6Kz2zFJyDTfpvgUIMOfK8IkzEg=;
 b=gHwkm7HVHZ8T0LPQpjvVqp2XRxWCYJ0CbvOr6lN/WYEOX4BpWZd+aAbw6w1Rpk99tT3HIiis+Oirhhm9J2rss0o8EpWZscEpq5jDssrxLqP1Jj5g2U9rEsW7TNebsw695mjuM9wv+Ne/vY/FDuB3POP7s5SfCISPQ3T7Tf5ZqLms7/zjzUau1Z6q2sm7/VOxp74AxIwXmZvmM5YliX+d7YWxSgz5bFQOjkbjBgOE5MHCADZjiaE7nKIjmlGCjAu31o6TAy/+5ghrIvvpOEwjp6CtIqF/PbkpgPVO9hvclJjZn9MKyZaJuilSZe53K1rVirwXNKmxmY8yXsI85LaYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 20:07:53 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 20:07:53 +0000
Date: Thu, 15 Jan 2026 12:07:49 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <priyanka.dandamudi@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_multi_queue: No engines in virtual
 test expected
Message-ID: <aWlJFR7xsFZPMSGs@nvishwa1-desk>
References: <20260113211558.149105-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260113211558.149105-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ0PR11MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e8da98-5a83-491f-42a3-08de5471c3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UpJ9qiKJVrBtmgPin7rmSsh/vBx1aPJYOjlX2pdpVvA0X2zp8ilM97mcOUEO?=
 =?us-ascii?Q?JdyWTfpVhPZ+hsRVNJC+HZkiO4msDONnVlg+Iu4GlWoYUWblKES23ksNP+nD?=
 =?us-ascii?Q?MtPWImU61Boef7+cZZmsF9B9pKkdzJU8cgUnQxpfU2FJyqrMpf9NpxnmCcHT?=
 =?us-ascii?Q?EDzKa0Rp17pas5iCTN6FM5Me2RZhCnbU6TxIZmZycvFt8Cibae4nx+uGN85Z?=
 =?us-ascii?Q?M3sLd4QTtzLkOJWjF/zSU5vpkOIijcPm9kQF1/eZ7SVPoESwpNnfTj7VSB5C?=
 =?us-ascii?Q?lvOzLxzKIITHpB/QpL6uQMNtc4k7A5PnNK8uHsdzmeIlrXHUl5o06ZSi3L2g?=
 =?us-ascii?Q?v6zKDf8TUhLEc8hBmJzMZf/2SOo6sxXuL1E/P0mL+DBeZJECOZsaSsoIFgZk?=
 =?us-ascii?Q?sC+ye5x2h9zL1UZcN/opHFBAafVAmT9Q+sPcYDjqwrBqYKf9axcecttXKGkI?=
 =?us-ascii?Q?AajH4YeVBCTfaOwcA6Vbce9cptk3bA9pKVQASBDWXmOgMwHLh7T5Uwj5/U7Q?=
 =?us-ascii?Q?xlUVzekFfeXDXa5Bd163U+1vmMUtDYaFUhl7ihS+5u7N+PyQXk4Edr3u6O/W?=
 =?us-ascii?Q?WxwKv/GaIpxhp0DbXU/ShhvqAbo7oE4w2aW4VCRphM4eeSxbCQ36uvFbG0kA?=
 =?us-ascii?Q?t4c2zeNgTiLBCFfmE34/od3LBdBWR8zFsmDAN45xT/Ph4UkMROjV53W9xe3I?=
 =?us-ascii?Q?Jbsuck0qKuP1N9tvEpOECzf27Uty4JU9XDWtyYrWDfB4yS2URDz6zD9cMNSW?=
 =?us-ascii?Q?kMs4ZUDIlxtNvQI6VjAVwPrgLop3g/avPAHCHB9fYKuy7QQ5IFo9GwfHr2f7?=
 =?us-ascii?Q?mYy2hfMTjDVdTQSe9yTw2eVEUeAKNX+0yMOOx0pJel8AJ3SndfJCnN8PcXq7?=
 =?us-ascii?Q?CevNIO7iDDtZmt2cxDlrXG3SnLBnKnvuYnCzCMKiwCwQuc4EpHT80f9l9IxA?=
 =?us-ascii?Q?71gyOCJUoxRjznnauIoo/XAMxU/fngABsiQtu4ABXKzjMf08F63gbldWpaOM?=
 =?us-ascii?Q?b0lC9TnwkCuLSXbG7oBdZv7bJuR4DpmPEXr+8+QTt0lQQYV9v/iIQWTmN9+d?=
 =?us-ascii?Q?OJjIzrOmT81gUP+wuyCejqA1QknHRA93HpA5bq+FT/Mp5upKLZffgBLlnWhg?=
 =?us-ascii?Q?W+6Eq5ECgN2NEubW/+4IxEGjq1Zx1CFco3mgipd9c2MbIWvL5Kxk1sJGnDeo?=
 =?us-ascii?Q?OvQ2aVHP5NZ5CWbWLH57c/+BYocCtFCrcS4ehVNZI5xVOaprbqHOEYSoEXd0?=
 =?us-ascii?Q?x2CI+DKrzhHV9NDnuH5E5XdlGbNKhzxPTHVeBgtD6ea0haC3h75Mq+crI1A4?=
 =?us-ascii?Q?iXeJGl0LjPy83y59cFCjgpgU3ZS/DJWUCNSxt4DePw5XD0zeKAZGzckekVp6?=
 =?us-ascii?Q?HQIJdmzSn3XfJ5BLuWdikyhkUpRRDE2W9XIm1ugORivojb9agk6GtFyEIVC8?=
 =?us-ascii?Q?jYYlhvUl7G3Evbxvdvj85f2JudpzW+SHN6S4mZpI+85fQRmtfElwpHcq/xBt?=
 =?us-ascii?Q?7bj5eYJUGig/Rp6gLeeOOdwtzDBDHmgFurRhpnatvNUGydxeL9xC59RhONnR?=
 =?us-ascii?Q?w83wlY+vE4ge09Z4xcY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rmgVf+vkG/Vj1oQBp+GCrlDe1tcUA/2IWZwauB605edkB0NozQGcgaLoAxua?=
 =?us-ascii?Q?YHoI2he0jK7N7Pa85888OqpDTXU+h2Z6V/eZBzHXZ6lRY0gPJIED7TUwFqS7?=
 =?us-ascii?Q?CgyEvE7nkEyyEmwnpT0Fbun0VfW19GLsZ2avaQ/niHUS97Bfpfgpg45LvZDR?=
 =?us-ascii?Q?WxOGJNtUex+MltO/wyQdK79rOofu1x2syidsFhpzit6QhUxCpJTKCWV0H/nW?=
 =?us-ascii?Q?jrWKlf3VWfFLdxK/6lgF/hRnfwBzgLtolLBTmxbCPIXgEbZ0UfuBhwoHekOq?=
 =?us-ascii?Q?lXXT9o44tCvHcu4AE5ToUyqIXmr1sarMYzMPrQubpnR6j6VV7dEAmv3EjguT?=
 =?us-ascii?Q?N8//6Rno2RgbJgTsMlkBneZs0+3xtkVV9IyYV66shZZjnQLKPyS1HjEWbBUZ?=
 =?us-ascii?Q?AHdJIzJBr59pw6hJP5R+Yo13SFd7ErNZnhABX8FDLSAvZqK86MJA8SsQEt4g?=
 =?us-ascii?Q?8BLmZaHJuEHGBhW0xHWxcvLcKmy8VGMBQpAVfyhiI1Jk0CjX8Eg2Cah+pidf?=
 =?us-ascii?Q?v7SlBZ+YiFyzKmXtXjNRRIAiWniwisX8tbe+6d8O7po9EzK48Gc0Y1oyZkUY?=
 =?us-ascii?Q?wWsJqatpLfUZtdcTGV9DmhdF2H0fN9mwJZHjxYby5X40fq6ABoFD8MYRNoTD?=
 =?us-ascii?Q?nsd1a2E7YH7K0gshcM/uHGEInsGkRJO4JwOkJbzDuueKU5mo6xShTCQQpiWA?=
 =?us-ascii?Q?JRnbaOnGZYUZ9nU4GaOkvl8zte6LMbOkZKcnt2HBSjRQpHWseZWOxsnQrR53?=
 =?us-ascii?Q?mK+fAbek+SPXICCdx5ZSPRkrn7bniMpJmpIP85eDLbZ2MDXnRu/9+xkh1F8+?=
 =?us-ascii?Q?TVlGBDoV15Ggt8qIhyTSyrqRm3EX1X5r6fvUlGxlx2I+SnSx9+MlVDnZFXQh?=
 =?us-ascii?Q?OftyIg1rLokOZb17wZcxGeF0dNaEYMrfIfXY9RhIoMtrfpwF3NriEkvbWc7k?=
 =?us-ascii?Q?1znX8/fiXOXntNJPW3/5P8IOADXyuqloIde+AlHlJy5xs/duzZlGzDvkxKUl?=
 =?us-ascii?Q?iWRidcF3HxUYXVtUIShBunReMJ5NbJHn39fr4A1JbliWB62j/QOW5IxzDxTc?=
 =?us-ascii?Q?X/K5pz5X9NIkjxnOm/xGqzO4NC3ITTnuWpGx3wDL1mvFFi3DoPCwbvKqqhgH?=
 =?us-ascii?Q?fjuEN/lFHWI8mREIZeZatjypVkOe+nDcvNBy4ed0UxZLWoIOb7QYVYsXk9ML?=
 =?us-ascii?Q?e46tq982EEwdVc/qe8sOI9dISe0AIitP/NxCFao40sP9bPNsbsjHq0yAPbxT?=
 =?us-ascii?Q?W3QS6Ln/gVAwB7ufTeWlyJ8MVXHwkLuQgCqzIjlmWKZ9KqSLPXF+CekTAbr2?=
 =?us-ascii?Q?IOt92JQNtDt6528VK2FooEodk3d1aYgi3eyfML7Kh5s6QhfIQyKfZ3usKURu?=
 =?us-ascii?Q?gwOllQ7oHWAUu5sWDRJyT0vkUQUfMDZFIpp85GifA/OhKcMUycAM8efeMzvf?=
 =?us-ascii?Q?sYEgDxlpF6375qzc+xp01aeMgfbRdZ59BVjQQfDZ8B6Zxhn+fF6xgIQVDZVu?=
 =?us-ascii?Q?DWED+VDGW3yEegbGLcZemOU9wVO+7K4iDHXTR6/9w7is0UT2C2pz57fDF1QT?=
 =?us-ascii?Q?O1t1rq8AGq1tsRRTnKmIWKZIw3ve5C3jSt4sJpWRrmFUN3YgR+UwSkJvcIoX?=
 =?us-ascii?Q?ynA88Y/C7/DyyI1QxHHSdaeZ44CLju0MLT/X3wsNYo9xdahel/qP8p9g1lsr?=
 =?us-ascii?Q?yJlu2bUfyUQNM+t5AhdYQOKGPk2KrjjQoP9oa7YWLQzvSDd9OlFP2Jdy/KMO?=
 =?us-ascii?Q?js7ZWZPdgyEqeStXGn6tzBagIUrrlzv/39cqpu/FSAuISj/63aHP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e8da98-5a83-491f-42a3-08de5471c3f3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 20:07:53.1329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWTPLE9oMIbyVVPdr7ueBMTNWqPjzlg38/NsaY1TNZuceiXxXHjzDHRSMJMSJlSu9wjWXrMR8Xy+W7xlvQSOMOYwde8d2X9GBLGtBVwT04LNurMJiYbYC7MjQjC7lGeG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
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

On Tue, Jan 13, 2026 at 09:15:59PM +0000, Jonathan Cavitt wrote:
>In the xe_exec_multi_queue@virtual test, we currently assert that at
>least one engine with a given class on a given GT ID exists.  However,
>the way we generate these class and GT ID pairs is through brute-force
>(I.E. list all engine classes that support multi queue, then list all GT
>IDs, to generate all pairs).  This frequently results in invalid class
>and GT pairs (E.G. attempting to find RCS on GT ID 1).
>

NIT...we can remove below example as RCS doesn't support multi-queue.
"(E.G. attempting to find RCS on GT ID 1)"
The rest of the commit text here is descriptive enough.

In anycase,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>While a smart solution that only generates valid class and GT ID
>pairings would be preferred here, doing so would probably be overkill,
>so just remove the igt_assert case and exit silently if no engines are
>found.
>
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>Cc: Stuart Summers <stuart.summers@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
>index 6bc6f9f63b..9a02744967 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -995,7 +995,9 @@ test_exec_virtual(int fd, int gt, int class)
>
> 		eci[n++] = *hwe;
> 	}
>-	igt_assert(n);
>+
>+	if (!n)
>+		return;
>
> 	test_exec(fd, eci, n, n, n, 0);
> 	test_exec(fd, eci, n, n, n, PREEMPT_MODE);
>-- 
>2.43.0
>
