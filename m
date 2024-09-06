Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1CDE6FE46
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 18:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B87E10EAE2;
	Fri,  6 Sep 2024 18:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYp8jePk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513BF10EAE0
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725648884; x=1757184884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PP2vWmz2EolDHopSap+ObObHempRv1X77T+c/jOymGY=;
 b=bYp8jePki6H9mOnbgsfl6GtBvrE7yjnnMWG9jDyLXPzVfEECOA0Qs5te
 uQ4WFFHwVVRlNofBleovUf9luvSFP/xputIfMwZnBRhiVyyxFKZdjtPGc
 CWY5Tq+akDh4IYtacIcRkpRSXFBccrLOUEiiBQrrNopIqWnLpk1y37Li4
 Ad4VTysZLLk3HNcP7pHBJj1JZdGM8A7pNTMXy8NDiIRl4BwdTsJREyecx
 eN1eCxROl+snRyneNJb3iGWfgvwHgmquBq3pejvRGi9amHGh+P8Y/3zBo
 Zm5iOIDhrkNQUtJ5LAE/nY6U+Cuyzq+BIWpar0z+Rlr2LoKtDzuPOknB8 g==;
X-CSE-ConnectionGUID: jA9kC9NURWy3/eXGUCvUiA==
X-CSE-MsgGUID: vTJdA/yZTbuvWoisfZnzxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24526396"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24526396"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 11:54:44 -0700
X-CSE-ConnectionGUID: J5t4QUnbR82q+p0grsBVmQ==
X-CSE-MsgGUID: RPM+Kbv7ReuBMtZkSlfBLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="65725976"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 11:54:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 11:54:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 11:54:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 11:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnsrUNa2FqcT39vCcHN//wsH2Q4kQfHkHdjJnf4Eb7bqufvknZb00fPayRysEeWjNaTIt33WZQbFaca3AGQQhSZESvnJQrL+C5UIpRu8D3wPwM2tsHCM4pQtR6E7pj3wl/+AgqxXpWZEDl0Og3pZEV7bXxwXTcVV2zStDtWNk4C+mdKie6f/29FZrvJlBoTWPjz2hLFNcTwqOVRqUj3dz1dBdGRYgDF7klQl3UHpv0cP2Mtggt+7RJd/JTnQlFWdMBF87KEu0riHGs4O/np0lBpnEGVaEphvQy1puUSnwZqkFbcph7fcRANd0twbWrc7PGUwPLo+noNXrjvoF3tbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/yskG77cqUrHRLp3i6zniF68nq6gR07A4fVmbqgm9c=;
 b=pS0N+hBOvmlE6n0nlN1farVGyBe8FTT/T5gKkD41datTWhB5N21d7KsLEy8C+tz4LBWV4PnUr2YKed8dkhSUsczY1W06xf1JIpRd5UfUpo/yrdZN23kbqtJJ2YAl3nCYfHSZEa85PjE8UvxSqhY7FzYYvvDk4jU7xl0rXuLc2L1Dx/1nw+nqQPpDMGifPEBMfJcCf1xJxFyCajOQn1pZNLjf+OVb2ZRu4QIssnWBBUyt0o6h8VPs1Hk9hmkEqZ9hA02ItX3OgQGwsULK7Rvkxqgnn+w16P2uI3JnXscj6yIrMB6Q6I8Z5Q/y1TF8Iy7lo3uN+HxDjrBmPs9Ya6k91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 18:54:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 18:54:38 +0000
Date: Fri, 6 Sep 2024 13:54:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Wire up
 parallel/virtual submission
Message-ID: <maccwdzt3b446du6nud6lewox6irkscu3ermdrteqkfakv7xk6@7ov3teecnqss>
References: <20240904225746.2857448-1-lucas.demarchi@intel.com>
 <20240904225746.2857448-2-lucas.demarchi@intel.com>
 <ZttCa6mrfuBa109s@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZttCa6mrfuBa109s@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c75e85-dcf3-4b74-b59a-08dccea55b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ncZdnWzXpQD8S3OlGmP6BJkX0fXleE3Q/ySQyemzVTV/lyDS0XHdCSmwUXf?=
 =?us-ascii?Q?5qMYydRlqloK5A3eCTFvSq7qMlTuC4NhPDnrUkKiB2gUOMmLr55jNH+W/pgf?=
 =?us-ascii?Q?i+mjy7Te76qife6frJm8y8UeOeeu2S/5sPusjYJVG+rC7tbiCuMSL8J/46FJ?=
 =?us-ascii?Q?QsGQx3RiK++GlzUboE5BBv6u2fIYIlvF/3nE1YkL/yiDNfv7RNKdSwDElY0P?=
 =?us-ascii?Q?/L6U9mm1YQ7gNd/8Dd59wFTcGCUJjNQHVkZyALucCmdIRqHnpjnb3YoEIDq4?=
 =?us-ascii?Q?7+kNovH6QvHwqhhSPGMay7d4oyQiICMsSnfD/nX39YcLlSo4tochfISIrjky?=
 =?us-ascii?Q?AWcs2EvQqPizTP8hCH8fA4yF9JwRxsAUjm5XFJAodGZMMSLkW1yjKh/aG13+?=
 =?us-ascii?Q?eIWlL4ZNQqPIP8IKC5e9gpn77RxAK1Vcmap+pDALejkLLE+1u0/VMk0yLicr?=
 =?us-ascii?Q?OJJaOBOzwSwUWUYYM4PIn6Bym+AfFC1K5oFGk17E/og6xBFX4JgW9kdjZm4u?=
 =?us-ascii?Q?zGE0tWbMYYd/fV7ptUm1610GsuMYuNDP3nlLj7P/ECVkY0ngSLyQClkRB2W4?=
 =?us-ascii?Q?DRsWDB7QypwSKOeInuzYy5x6PLaLqvbjYOq4l3gksB2+ghShVloosxRs4dEh?=
 =?us-ascii?Q?ImOhJF7Asc/8NvYm6GAkLq9B8WXNnO4sSP9LwAkQiy7qImL1CsrxV7UgYj38?=
 =?us-ascii?Q?LNmQh+RP43l9OCMXGA1SAo3ygHKTOUkyjrgWh3QSOC4iroDFUlX6d9ACXmLM?=
 =?us-ascii?Q?1JeIuq8wjZn38kzyuoF+xLfR498mrCGjZrYLgmEhI/Da2XEJGGstX9YdN62C?=
 =?us-ascii?Q?k4gjzABeHHrnH1DBAyvWTb6PalqZV0aUtWNfpgH3vg2whWP7FcmScn0HC4t7?=
 =?us-ascii?Q?uGn1k1XJwJU65gLu693/is2AQN/6JOFmIXlUlhLJjIH8+hyeaQeSXvzNB5bP?=
 =?us-ascii?Q?e3yyWlJkK++vloBGy7u2FL8s8dyxg9Rz/BMD/fWD7QMtagY+Yqu2b3h/F3No?=
 =?us-ascii?Q?ZwvLj3qoLqqsaP94vxkkvWB/N1Xq9wUQ4Htuxgc/4QW1aiUS5n3UHfro0VPi?=
 =?us-ascii?Q?rCSzXpDgCE1vrPGawYmpWXtI2SZK2bLZ9PkSk0ZGpOYa+eu2CFwIX99e3+F9?=
 =?us-ascii?Q?ZNnHv/uOvwf9WDnZs+X9y9mHNIUUDnsWac4iqfNuZIrYBhpJh35pBEKm4dpO?=
 =?us-ascii?Q?Wg/WQl/4tbltYBIMjZHNY+ybKPsdBS+UFFKqIUXHafkSGBKhnDbSg8huowWm?=
 =?us-ascii?Q?fGvIyWx/NcfTQkQQkg8R94+3jOpysYy9fZUoX+DUEGuOJXh7FEed4Sk49qbO?=
 =?us-ascii?Q?OBBGYKFjgLeRq2ABdqY66buOhHzi5WLZ9XSldH0jXegKhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mixc0J7AXbkxkOH+dcxVBhgRePWCFAZpX8sDeVaNpuNzlaO6qyQv3ylzn6GX?=
 =?us-ascii?Q?hSUII1oq6TJ7Re2ycpoVjEtDmD71pPRPj0PFxgp/0v58CY3j2lJdqqjXe0HO?=
 =?us-ascii?Q?ZrO5Agy6nox5xBoQBtfxuhOTHwdbwXkZ5+0P/wGC/Vlw4qzJ9y0/S30oZo+p?=
 =?us-ascii?Q?Tcdx3a1gjuh6rGBYzLpSHeJiQ2TYTa78/e08rMKQaYHEEXknfOgQ6bn+fTyV?=
 =?us-ascii?Q?4MbywBl0b3U2vbY7z8W4kgLg9/itXcKLL/gYU44Z2aNoRSWM2gqYxhzlGTj3?=
 =?us-ascii?Q?AZ4b6ak93zMZKNap0KylQ58J6ZWtd2wdOi1lu0gYIJkZA/ZkjyPXaovLtL6L?=
 =?us-ascii?Q?5sPTc3OUoeEe3+FCRmB5bpfg4cOGIzdRcXZL0pJv/1P52Jp9ngLnBoNNyz8S?=
 =?us-ascii?Q?TMqHcT3lD58aLrTdAKoyQT5IK27+Ld3ygsDL3eqjBHLjJcuKzByuVsqpSdrE?=
 =?us-ascii?Q?Qr5TAa02+0hOuxzxtAjACJSEr6vWhJ0wntviA7kVo9nq7Hc23EsY6BnngzBj?=
 =?us-ascii?Q?cR7FvvqbF9YpLGeRcdds6QuOpja3iAkYrPg0mpTk4Jso+rG8Sp5+LE0l05CV?=
 =?us-ascii?Q?lsg7xK4f/F3u9OxNZ9KoDOutmfe3fSRFCtdurcWUI0UpjQTq9iah0vZIXBKP?=
 =?us-ascii?Q?aqLnwK35+mATJV/AjzS71KHQtDYavfwRqACH4FCsZbe09I6bcs146VOhOIjm?=
 =?us-ascii?Q?JBK4uYQHZFr8OdCYQtFzl8++/pQ3EWs2+x67f91i5vnglGN2rhDnuSJVxbXg?=
 =?us-ascii?Q?dZQ1/AMsCuY4+Ly0rUh52xaftzaFGvJJamIjlwrTP0RVHzkdCF7peTEy+emQ?=
 =?us-ascii?Q?bcI4jCHbwRM225ZX6rrU2WeUA6NXxY8rBce5Nl12kq4+bJsD+H3Xz3/5Po4+?=
 =?us-ascii?Q?ltRjDSd1TyBGJ2rTUXQpBfYLHluG5U5/BylQLpT5a49OejVwqk7GgyJoAXLg?=
 =?us-ascii?Q?4auor1CUwh30e13ej5MGFGyf+3IQYA/yI5MRiy6GzvsK4ypiidE0nDdJtuil?=
 =?us-ascii?Q?XfAbMRSkag9tNijWEqVSgcQS5cbqXQg8Cc3ERVoLjDUR9g4v38N5lLgvBp1m?=
 =?us-ascii?Q?v/C++zSnzWoNCk9dNajIfQeGdEmfKZH278yk59og8yVTd86RWlk6xPivspjl?=
 =?us-ascii?Q?zmINuC4NJvp1O2WZG1IsCtUNAJjixqYNuy4sEMTLmQZWR73uynMcBiDuZHuL?=
 =?us-ascii?Q?vEvFS58K/82HnKCDzdwopWo1e86G9n1j6nKGFi5ZEaQcmuhNQGm70YSOAYAP?=
 =?us-ascii?Q?vYtv4N7wMasF3laU6MvwuBMAym86Vc9aHwvtq+XGPf1sZSk5HAMxaWs4sURd?=
 =?us-ascii?Q?bk8YkBWom+L2DkVfLCiqutjI469aXNjtG6wa7YkULHtObNUaDWqvpgOllniU?=
 =?us-ascii?Q?iTp6C3fmOXOkr+BZ8y0uUkiDplvH//SqQ/5xix/r1olIVkZ7B8BrWhpv5ISQ?=
 =?us-ascii?Q?5dBGYzFfkqQpvRfRqLW915T7n5FkFTyAG/20n704wQ1/BPlOOCVEjOvjpN73?=
 =?us-ascii?Q?V1JVKaL8TmKQXYvL+PjIRafZyQam40T8JTbkZEEfXf3tE8SvAJdINK4IOjY1?=
 =?us-ascii?Q?9r56C4M6TFkr3K/NErGq8MGL3Jy24cQs+2s98wpUpcJ55NDDyBkRmIhRlhFI?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c75e85-dcf3-4b74-b59a-08dccea55b94
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 18:54:38.4095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4GfPUDKq0Ry6VBfzrh7p8LUCzi5nh7nfkivP/I/ZDkOgD2IHMVBtILYSIVzKgFozzvEybxpmhVc3bVM7RLBvAmeu5+1z/cxPLSWZh+2Xio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
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

On Fri, Sep 06, 2024 at 05:56:59PM GMT, Matthew Brost wrote:
>On Wed, Sep 04, 2024 at 03:57:45PM -0700, Lucas De Marchi wrote:
>> Add the boiler plate code for parallel and virtual submission in the
>> spin_ctx_* and check_results(). This is based on previous code by Umesh
>> that got simplified before applying.
>>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  tests/intel/xe_drm_fdinfo.c | 61 ++++++++++++++++++++++++-------------
>>  1 file changed, 40 insertions(+), 21 deletions(-)
>>
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> index d1ed0fcaa..8acb95040 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -365,7 +365,7 @@ static void basic_engine_utilization(int xe)
>>
>>  struct spin_ctx {
>>  	uint32_t vm;
>> -	uint64_t addr;
>> +	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
>>  	struct drm_xe_sync sync[2];
>>  	struct drm_xe_exec exec;
>>  	uint32_t exec_queue;
>> @@ -375,18 +375,29 @@ struct spin_ctx {
>>  	struct xe_spin_opts spin_opts;
>>  	bool ended;
>>  	uint16_t class;
>> +	uint16_t width;
>> +	uint16_t num_placements;
>>  };
>>
>>  static struct spin_ctx *
>> -spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
>> +spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
>> +	      uint16_t width, uint16_t num_placements)
>>  {
>>  	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
>>
>> +	igt_assert(width && num_placements &&
>> +		   (width == 1 || num_placements == 1));
>> +	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
>> +
>>  	ctx->class = hwe->engine_class;
>> +	ctx->width = width;
>> +	ctx->num_placements = num_placements;
>>  	ctx->vm = vm;
>> -	ctx->addr = 0x100000 + 0x100000 * hwe->engine_class;
>>
>> -	ctx->exec.num_batch_buffer = 1;
>> +	for (unsigned int i = 0; i < width; i++)
>> +		ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
>> +
>> +	ctx->exec.num_batch_buffer = width;
>>  	ctx->exec.num_syncs = 2;
>>  	ctx->exec.syncs = to_user_pointer(ctx->sync);
>>
>> @@ -405,10 +416,10 @@ spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
>>  			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>  	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>>
>> -	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, 1, 1,
>> +	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>>  					     hwe, 0, &ctx->exec_queue), 0);
>>
>> -	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr, ctx->bo_size,
>> +	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>>  			 ctx->sync, 1);
>>
>>  	return ctx;
>> @@ -420,7 +431,7 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
>>  	if (!ctx)
>>  		return;
>>
>> -	ctx->spin_opts.addr = ctx->addr;
>> +	ctx->spin_opts.addr = ctx->addr[0];
>>  	ctx->spin_opts.write_timestamp = true;
>>  	ctx->spin_opts.preempt = true;
>>  	xe_spin_init(ctx->spin, &ctx->spin_opts);
>> @@ -429,7 +440,12 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
>>  	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>>
>>  	ctx->exec.exec_queue_id = ctx->exec_queue;
>> -	ctx->exec.address = ctx->addr;
>> +
>> +	if (ctx->width > 1)
>> +		ctx->exec.address = to_user_pointer(ctx->addr);
>> +	else
>> +		ctx->exec.address = ctx->addr[0];
>> +
>>  	xe_exec(fd, &ctx->exec);
>>
>>  	xe_spin_wait_started(ctx->spin);
>> @@ -450,7 +466,7 @@ spin_sync_end(int fd, struct spin_ctx *ctx)
>>  	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>>
>>  	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> -	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr, ctx->bo_size, ctx->sync, 1);
>> +	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
>>  	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>>
>>  	ctx->ended = true;
>> @@ -476,7 +492,7 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
>>
>>  static void
>>  check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>> -	      int class, enum expected_load expected_load)
>> +	      int class, int width, enum expected_load expected_load)
>>  {
>>  	double percent;
>>  	u64 den, num;
>> @@ -490,6 +506,9 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>  	den = s2[class].total_cycles - s1[class].total_cycles;
>>  	percent = (num * 100.0) / (den + 1);
>>
>> +	/* for parallel submission scale the busyness with width */
>> +	percent /= width;
>
>This doesn't look right. Wouldn't a width submission be busier?
>
>Maybe I'm confusing myself but everything else LGTM.

the thing is... the fdinfo reports the number of engines of each class
(drm-engine-capacity-<engine>) and expects the reader to scale the
total_cycles according to that number.  We are lazy here and instead of
using that number we use width that was passed as input.

Example, with "*" denoting when cycle is ticking.

		s1		    s2
ccs0		[**********..........] == 10
ccs1		[**********..........] == 10
total_cycles	[********************] == 20

cycles[ccs] == 20
total_cycles == 20
width == 2

Calculating according to check_results():

num = 20
den = 20
percent = (20 * 100) / 20
percent /= width == 50%

which corresponds to the reality that this client occupied CCS
for 50% of the available time.

Lucas De Marchi

>
>Matt
>
>> +
>>  	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>>
>>  	switch (expected_load) {
>> @@ -522,7 +541,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>
>>  	vm = xe_vm_create(fd, 0, 0);
>>  	if (flags & TEST_BUSY) {
>> -		ctx = spin_ctx_init(fd, hwe, vm);
>> +		ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
>>  		spin_sync_start(fd, ctx);
>>  	}
>>
>> @@ -540,14 +559,14 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>
>>  	expected_load = flags & TEST_BUSY ?
>>  	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
>> -	check_results(pceu1[0], pceu2[0], hwe->engine_class, expected_load);
>> +	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1, expected_load);
>>
>>  	if (flags & TEST_ISOLATION) {
>>  		/*
>>  		 * Load from one client shouldn't spill on another,
>>  		 * so check for idle
>>  		 */
>> -		check_results(pceu1[1], pceu2[1], hwe->engine_class, EXPECTED_LOAD_IDLE);
>> +		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, EXPECTED_LOAD_IDLE);
>>  		close(new_fd);
>>  	}
>>
>> @@ -565,7 +584,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
>>  	uint32_t vm;
>>
>>  	vm = xe_vm_create(fd, 0, 0);
>> -	ctx = spin_ctx_init(fd, hwe, vm);
>> +	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
>>  	spin_sync_start(fd, ctx);
>>
>>  	read_engine_cycles(fd, pceu1);
>> @@ -579,7 +598,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
>>
>>  	xe_vm_destroy(fd, vm);
>>
>> -	check_results(pceu1, pceu2, hwe->engine_class, EXPECTED_LOAD_FULL);
>> +	check_results(pceu1, pceu2, hwe->engine_class, 1, EXPECTED_LOAD_FULL);
>>  }
>>
>>  static void
>> @@ -593,7 +612,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>>
>>  	vm = xe_vm_create(fd, 0, 0);
>>
>> -	ctx = spin_ctx_init(fd, hwe, vm);
>> +	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
>>  	spin_sync_start(fd, ctx);
>>
>>  	read_engine_cycles(fd, pceu1);
>> @@ -605,7 +624,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>>  		enum expected_load expected_load = hwe->engine_class != class ?
>>  			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
>>
>> -		check_results(pceu1, pceu2, class, expected_load);
>> +		check_results(pceu1, pceu2, class, 1, expected_load);
>>  	}
>>
>>  	spin_sync_end(fd, ctx);
>> @@ -632,7 +651,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>>  		if (_class == hwe->engine_class || ctx[_class])
>>  			continue;
>>
>> -		ctx[_class] = spin_ctx_init(fd, _hwe, vm);
>> +		ctx[_class] = spin_ctx_init(fd, _hwe, vm, 1, 1);
>>  		spin_sync_start(fd, ctx[_class]);
>>  	}
>>
>> @@ -649,7 +668,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>>  		if (!ctx[class])
>>  			continue;
>>
>> -		check_results(pceu1, pceu2, class, expected_load);
>> +		check_results(pceu1, pceu2, class, 1, expected_load);
>>  		spin_sync_end(fd, ctx[class]);
>>  		spin_ctx_destroy(fd, ctx[class]);
>>  	}
>> @@ -675,7 +694,7 @@ utilization_all_full_load(int fd)
>>  		if (ctx[class])
>>  			continue;
>>
>> -		ctx[class] = spin_ctx_init(fd, hwe, vm);
>> +		ctx[class] = spin_ctx_init(fd, hwe, vm, 1, 1);
>>  		spin_sync_start(fd, ctx[class]);
>>  	}
>>
>> @@ -689,7 +708,7 @@ utilization_all_full_load(int fd)
>>  		if (!ctx[class])
>>  			continue;
>>
>> -		check_results(pceu1, pceu2, class, EXPECTED_LOAD_FULL);
>> +		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
>>  		spin_sync_end(fd, ctx[class]);
>>  		spin_ctx_destroy(fd, ctx[class]);
>>  	}
>> --
>> 2.43.0
>>
