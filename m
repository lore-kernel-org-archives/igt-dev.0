Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55F0C54E49
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 15:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324A410E82E;
	Fri,  1 Mar 2024 15:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPgO18u9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209E210E82E
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 15:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709308392; x=1740844392;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rN/JXlxbuEvJV6Gf2bBMP1qUgWaNITnVp/H+WgI+iL0=;
 b=VPgO18u9r1kVwHtuIULz+oOM/YFAcNWfIDQf807PeNO1K3O5tCN5dJdY
 iiqLOGju5gRzsiJMKZPvdiI11n6q2CPC8pY7/Y1lT/K/qExATbwPmxfKr
 34a0+Ri+K5gsR7k9hFf/zyDA5sxHJWMr0W5q5PETN/1gOQ6ZUGukJ5IJz
 ppg5uozb07XEf1ImDGWql0No6arFu/aNuI9rEbJobqOfAFS49+qGae3ZT
 HwADyMvkgbt1KR8rL3KNbVZrDA2eUheFVE0wueSDWM8KFOC0ZE57mZo1k
 qrfWSJ+StS5ivw4EtQHzgzHtw8cNjxYolcTjqL05o4uTkr2uvhrmXzrYo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7621308"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="7621308"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8187802"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 07:53:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 07:53:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 07:53:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 07:53:10 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 07:53:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOUXPElGF8BiwWLYoxFKGm2T1nlr3Yj6KD3nlVM5Bx5JNbgVVVWXewfRO7NKsvqPMy3fVuM+terZ67QXAodl8MjISqWByTaQZkPSWA34pEY7D52/leEx/zAal5ribH0NE7xc4dG4i3GFOq5o1rOc/k6Q4F3ItFE0sjb/TFJPitPGnESt5KTCr6Nz7azxr2VFwDXJaGXXJm6Lnc4R9t57WdWFeICa1TJoYLLwiRFHmrRzCX+HFlJBPe59f8zvib1VO3UNtnUTp3FC7ctC8v8b6tzTY2Wi8IfpvtI4v8cYQmKCKzSUy2rZM94PO3BCI5Q4MpBJjaoUS3DOJ/I/HtmzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL3bQpOFl3BFVGgoJjqT57+rf7NhIs0oCMa91pSFfLk=;
 b=XvbUhezYimURgAkKIZpKn/2v/dXVvSTaImretv560SX6J3MEzhDVe6GGz7c7MBx8Cest7MRZMuLJHVlqkyeDsn7MF9qfFLRT2Yai+2FegRpwnSCgyepWCifcFNZ7Muzc5J9y5tQbPaLwRt8oLUnYU+PqRDS3LqP+32Z4JKDXds3ZYLIuQcCBMoJYOp+VMqJDpVsLNGlYhlY4yRngw0AgGdzkvF6xgSzmb27rKmDzoi9qbduMpE9D3uInA4cl4L1kEpJ5Qwcq0qfSK4J6KlRGfkndlnLihM3ltGHZBI2omkJ+tUzo0Dau+VmEyhHAE69igp2FaL6bs0Jfq44+S541sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8727.namprd11.prod.outlook.com (2603:10b6:408:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.18; Fri, 1 Mar
 2024 15:53:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7362.017; Fri, 1 Mar 2024
 15:53:07 +0000
Date: Fri, 1 Mar 2024 09:53:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 2/4] lib/igt_sysfs: stop leaking fd on write
 failures
Message-ID: <renzxymxwd42xmdxq3xeelgheq3dkr2nzyxmgkw4kdkiqxkw2o@dgn6ip4ly2ll>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
 <2538584.Sgy9Pd6rRy@jkrzyszt-mobl2.ger.corp.intel.com>
 <rwu332noevjxmaapc5if63biksu7ftr6bvhcwwt64kof47uz4n@yvmyy34i3un7>
 <2635837.9Mp67QZiUf@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2635837.9Mp67QZiUf@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ba4468-99d1-4a2f-12f8-08dc3a07b042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bf3vT/kneruYsqZ4n0EUg69Nt9AcGUavQwa42q85LMIxyxVCtILgp2rIwjqfLWHMAYOXt8rHh1kgjbNAtrbK4oA84yxqOpUi3lSYjpZA7AfnGSwU383fyTuRREZb7Z2e0kS+68In0oX0R0Yf5XvlgcbJeVsIgbq3MCLxOgOk+zOpRJ4BhGBpE5zsk6w4Gqeg6VKrQbc+d3v9BEhR5UKSrPzvJCyZRjz4liyRMMsNOK1oRy6/kYXsdzJ4OyJ41fy9vBGBF3FAKKHl3ExrFlhfAS5nrnqtrNcOa5Ok0ZLG9KTmVZiLBSsL4xC5TvxyS06jasBCSq/uNt74xqirveGgrIJTX5OvyiPKT28HqEuaCjCAn/CjUJtt3oKs3tE2pY716FQ3kJgvolwoU2NOx9xwNlQ88eEhFWb6SAUtGKMcCOQBkFjfkIpvxVunp3KWxhON3mi0qG2joC4IsJnuPzBkrnKtnkgYwjUNLXd+tUNV4i8OF1pasJnjowDK1rniLJPjeUKv4nZw6+diINTB8zD6aqnaNLrxwRwMJ30+36F5x/jRhGnnluNJka1nXl1y3o1IwAjwc3vf8EVdEHPDaNlqKLOthR7V+/9TPYbWgvGQJUzjY+6niatx+Vk+eQhyXHLhQ3B6CPgoo/36++p3ZbCB+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N2QfIrT586MDUv/4HT1f5y6aYZZ3XDSvlhzFLYoE7OSC8GrJ8RODQVG8mPM9?=
 =?us-ascii?Q?NojJpT/ocKpoqZFR8HzKWR94R6FEW5ye5cQjQwr58BVB2ehVHxsCMhUIaP4N?=
 =?us-ascii?Q?wZHZT5Jk6VzuiZl0ubibIs/NZEmXLJ6kntJ/G/xHgd7iv8cIgHYIkUm5AbZ2?=
 =?us-ascii?Q?lVsI6dTEnsExOl6GCqtxCJcudvq0OwiiEBgfzyxgLDMoDPAy4qCkU4wPZS8L?=
 =?us-ascii?Q?klouCvr3pc57I5PsTSO44n3dh5fpzNLpZewVh8e2NKR+WwJFYD53pkAu6SWl?=
 =?us-ascii?Q?AOd7QnEnUWQkCbTKuZoba14p9cjMJWjhGSG99lsI0VD2VaJdVuWinj4tO69g?=
 =?us-ascii?Q?aqOmV9GobVRXxSF+i9Ah0c0ExeYSpJBCxi1hxSiZWuVXo1M3Po5pF3oRmlOg?=
 =?us-ascii?Q?2XO/zgl/8BXh6MWNd8/dSmMG/Qvb7rRVt4qqbVi2sClTAH5cBzaUh6fYGXEh?=
 =?us-ascii?Q?Rm6k1HQ4DdRqTTUyirPBj71Sp5GIWQjG5/3Dy2FlV/eYXugFXlf+Jiq4RnqZ?=
 =?us-ascii?Q?HHx3BGfDChG+htHS5fVZuVfxS/xSGV/1JnuOd0gEj1KGLdiDbr+3FvdKWWhG?=
 =?us-ascii?Q?or2y5MR91ylHTz0MKseIuXLohB/k04Sci6nMvQGGt0SMKsyosvIprykHYNuh?=
 =?us-ascii?Q?RPnzHI7yOnm1f9tgL7lZ5tjrje5ShVOCO/dkgmDhiujQ7fgeKQnhtC0rCJ7R?=
 =?us-ascii?Q?TRFoZutTROBlAbSoFFsyZBaqjFwpsK5pim+cbT4PYueo7Mo9A8PQCcJzaTDp?=
 =?us-ascii?Q?Fax7jz/qyiWvCdfh8+xQwQdcL9rJwtd5voDriKQvGtN52bjl+EVG/zDpqlcM?=
 =?us-ascii?Q?q/HjedgroX1du/ROAOhBmUqr49miq1Cswfcq7aIjzTCzXgtv82mgRP26YYfl?=
 =?us-ascii?Q?EHnThTWsutY2Bb+jCOC492pCME39XN8JOMWAaoVns/5ZDhwXTX296lrh9oMa?=
 =?us-ascii?Q?lybE5IoQ4H4K7tiP5m6RZ/uYuNwQGC3wHWXZVlfbBeXwPtt81gKMg6rGoDPz?=
 =?us-ascii?Q?BpIfPe/gKx1eylgxy5uEh48Y+1zjvxZhdVWxwiSgGAg0Oua1gcxCSwhfBC7e?=
 =?us-ascii?Q?UPxjruGpSXEim2W6MdZF0bH38edxwAk26VE76GAuKofiYzhHDRCAJPN9M31g?=
 =?us-ascii?Q?c8LjaNgcAU8L4w8g2IYURPY0Al4aIrdOcBcJAqspNnN3AC8eZR9bXsJz1xA2?=
 =?us-ascii?Q?gchQYfKIKSP6T8nWMPlq7InKK+wDtn/6GkILU3oRJTJ0KAOgN3U7hsb5X90B?=
 =?us-ascii?Q?I6ekiWngrXFGRydQKa1UUirl7KedSmqCQEPXIt2cTsoIk1/ZsKwyHkrFWx5I?=
 =?us-ascii?Q?yBlfl0YFjeMgQcr5g2rfuJE7hNdbZutW1qiW1OD8CizWnbK+uW/Urs6If0JA?=
 =?us-ascii?Q?mVmMhmq4JBdvK7kd2BZ6aJtlR829Ou2Os7DZ/Dxce7EKkS1F8kv4bH2TB9zX?=
 =?us-ascii?Q?tsNH7ZKLnt1f3ZFc5iNJmkMNQeFNuDcuYLXKDQ4VA5NJJZKh1NPnOJqb2fRc?=
 =?us-ascii?Q?9TdOTc/WKY886IHeOucdNHcCxvR02KVhcGUoFON/bthqWoFeqd/bh+PCAAVq?=
 =?us-ascii?Q?tyC/rtBpIZ+3sISVnZkFBYCylpljtfOyOM/O4yNgs3WKuQWaH/2Yew/JawGn?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ba4468-99d1-4a2f-12f8-08dc3a07b042
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 15:53:07.8814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACqQKFJHhvJq156ns/d4OLu6pQWAc6fRA9Ap1tIkcEdjgm357T+CIzRXw5OBmN9cdZ5bLLlM+XTeqyTWakaNCkFc2CjbsW9+/FAnhTExozs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8727
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

On Fri, Mar 01, 2024 at 04:15:22PM +0100, Janusz Krzysztofik wrote:
>On Thursday, 29 February 2024 18:33:46 CET Lucas De Marchi wrote:
>> On Thu, Feb 29, 2024 at 12:06:24PM +0100, Janusz Krzysztofik wrote:
>> >Hi Lucas,
>> >
>> >On Wednesday, 28 February 2024 23:31:32 CET Lucas De Marchi wrote:
>> >> Make sure to close the fd before returning.
>> >>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> ---
>> >>  lib/igt_sysfs.c | 21 ++++++++++++++-------
>> >>  1 file changed, 14 insertions(+), 7 deletions(-)
>> >>
>> >> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> >> index 2b0225138..2997925e5 100644
>> >> --- a/lib/igt_sysfs.c
>> >> +++ b/lib/igt_sysfs.c
>> >> @@ -515,29 +515,36 @@ int igt_sysfs_vprintf(int dir, const char *attr,
>const char *fmt, va_list ap)
>> >>  	va_copy(tmp, ap);
>> >>  	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
>> >>  	va_end(tmp);
>> >> -	if (igt_debug_on(ret < 0))
>> >> -		return -EINVAL;
>> >> +	if (igt_debug_on(ret < 0)) {
>> >> +		ret = -EINVAL;
>> >> +		goto end;
>> >> +	}
>> >>
>> >>  	if (ret > sizeof(stack)) {
>> >>  		unsigned int len = ret + 1;
>> >>
>> >>  		buf = malloc(len);
>> >> -		if (igt_debug_on(!buf))
>> >> -			return -ENOMEM;
>> >> +		if (igt_debug_on(!buf)) {
>> >> +			ret = -ENOMEM;
>> >> +			goto end;
>> >> +		}
>> >>
>> >>  		ret = vsnprintf(buf, ret, fmt, ap);
>> >>  		if (igt_debug_on(ret > len)) {
>> >> -			free(buf);
>> >> -			return -EINVAL;
>> >> +			ret = -EINVAL;
>> >> +			goto free_buf;
>> >>  		}
>> >>  	}
>> >>
>> >>  	ret = igt_writen(fd, buf, ret);
>> >>
>> >> -	close(fd);
>> >
>> >How about moving the code that opens the fd from the top of the body of
>this
>> >function to just in front of the call to igt_writen(), and keeping this
>> >close() here?  That way we wouldn't need the end: section of the error
>unwind
>> >path, nor those two jumps to it.
>>
>> The caveat would be trying to print the string before knowing if the
>> file can really be written to.
>
>Why the caveat?
>
>Do you agree that opening a file is more expensive then allocating a buffer
>and printing to it?  Do you agree that, from the POV of code efficiency, we
>might want to start from less expensive steps?

not necessarily... it also depends what operation may fail more
frequently: user opening the wrong file (also think about igt supporting
multiple fallbacks for alternate paths) or having a OOM situation.

>
>> I think unwind with goto is pretty common
>> idiom in kernel and igt, so I think it's acceptable too.
>
>No doubts.
>
>> If I move the
>> open(), then I may have to free(buf) in 3 possible cases (fail on
>> vsnprintf, fail on open, normal case).
>
>Since you based your justification on counting the cases, why haven't you also
>compared the numbers of paths leading to close(fd) for completeness of the
>picture?

because I'm not counting like "case (a) has 3, case (4) has 4 or 5 or 6
=> case (a) wins". Pointing being both cases need some unwind at the
end.

>
>>
>> The other option (that I prefer, but is not common in igt) would be to use
>> __attribute__((cleanup(closep))) which would automatically close the
>> file on any function return. For dealing with heap-allocated + stack in
>> kmod I use a scratchbuf struct to keep track of when it's needed to free
>> the buf.  But I'm not sure its worth bringing those to igt for this one
>> user.
>
>Definitely not, I believe, if only for one user.
>
>> Nor moving the open() is looking good if you also consider
>> free'ing buf.
>
>With close(fd) silently not considered as a factor that matters as much as
>free(buf), what looks good to you may be only your half of the picture.

because I don't really consider it as a least important one. If you keep
an fd open to a device (also including a sysfs file handled by a device),
then you may fail later in e.g. a module unload because the module will
be in use.  People then go and do `rmmod -f` which taints the kernel
(for a very good reason)

Other problem is igt not really using O_CLOEXEC very much which leads to
the fd leaking to other binaries, making the issue even worse.

>
>> So, let's keep it as is in this patch?
>
>OK, if you prefer.
>
>Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

thanks
Lucas De Marchi

>
>Thanks,
>Janusz
>
>>
>> Lucas De Marchi
>>
>> >
>> >Thanks,
>> >Janusz
>> >
>> >
>> >> +free_buf:
>> >>  	if (buf != stack)
>> >>  		free(buf);
>> >>
>> >> +end:
>> >> +	close(fd);
>> >> +
>> >>  	return ret;
>> >>  }
>> >>
>> >>
>> >
>> >
>> >
>> >
>>
>
>
>
>
