Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166CCC4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 10:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE22A1131CD;
	Wed,  7 Feb 2024 10:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJbyb1cZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11701131CD
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707300585; x=1738836585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bp/wuC8sOyRkXRZItoBBkl/x46NT8/0q7L3b0xGwdug=;
 b=mJbyb1cZa4Qr0N+Rvwca4uRnrNERzRRIdzWf+4wIjV0Lx+XXAFlr9SNZ
 9OQ2Nlri1u8lYpciUBdV9hU5Yxqf5R3jxPsT3pQulXXN77etnEuOLMqQI
 byTUbB4rCygruuT6vcBs6RPjYs+wwUHQo5BXuTBQkjpooqcA+cyDfbJEC
 FDdgSjKFjZzwd2WW65M3zHyeTkI+B22Drp5YYF7D50fR63Ra9C1ldUPL4
 6agzj1Bd/+l8Wjpz5q8UFCOF1+vgXWxaWJ+POao+O2PYJmfBlgKc38ec4
 xlMNCgCgeGUEfAaV69iVcvtChqwSIS1V3ZoasemRtNN8Xw2UJR7NHbyBL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1111570"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1111570"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:09:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="38716853"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.22.5])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:09:39 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/igt_sysfs: make sure to write empty strings
Date: Wed, 07 Feb 2024 11:09:35 +0100
Message-ID: <1824747.8hzESeGDPO@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <puqmq3gabtwf7xnm2quv3u7tnlqkkjrr3zpregdz55whjyn2r7@ayuvzgewlgpo>
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
 <2377109.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
 <puqmq3gabtwf7xnm2quv3u7tnlqkkjrr3zpregdz55whjyn2r7@ayuvzgewlgpo>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Tuesday, 6 February 2024 18:13:13 CET Lucas De Marchi wrote:
> On Tue, Feb 06, 2024 at 04:25:16PM +0100, Janusz Krzysztofik wrote:
> >On Thursday, 1 February 2024 14:51:26 CET Lucas De Marchi wrote:
> >> On Thu, Feb 01, 2024 at 02:15:53PM +0100, Janusz Krzysztofik wrote:
> >> >On Thursday, 1 February 2024 01:50:29 CET Lucas De Marchi wrote:
> >> >> 	echo -n "" > /sys/module/<modulename>/parameters/<param>
> >> >>
> >> >> doesn't really work as it will just create a open() + close() expecting
> >> >> the file to be truncated. The same issue happens with igt as it will
> >> >> stop writing when there are 0 chars to write. Special case the empty
> >> >> string so it always write a '\0' and make sure igt_sysfs_set() accounts
> >> >> for the extra null char.
> >> >>
> >> >> Shell example:
> >> >> 	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
> >> >> 	# cat /sys/module/firmware_class/parameters/path
> >> >> 	/foo
> >> >> 	# echo -n "" > /sys/module/firmware_class/parameters/path
> >> >> 	/foo
> >> >> 	# # make sure to actually write a \0:
> >> >> 	echo -ne "\0" > /sys/module/firmware_class/parameters/path
> >> >> 	# cat /sys/module/firmware_class/parameters/path
> >> >> 	/foo
> >> >
> >> >Still not overwritten?  Isn't that a mistake?
> >>
> >> in the commit message. Yes. It was supposed to be show the real effect
> >> of that, i.e. we do write  "".
> >>
> >>
> >> >
> >> >>
> >> >> Same thing happens when testing igt_sysfs_set():
> >> >>        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
> >> >>        igt_sysfs_set(dirfd, "path", "");
> >> >>
> >> >> Previously it was not really setting the param.
> >> >>
> >> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> >> ---
> >> >>  lib/igt_sysfs.c | 12 ++++++++++--
> >> >>  1 file changed, 10 insertions(+), 2 deletions(-)
> >> >>
> >> >> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> >> >> index 567b4f6d5..814220ddb 100644
> >> >> --- a/lib/igt_sysfs.c
> >> >> +++ b/lib/igt_sysfs.c
> >> >> @@ -406,7 +406,7 @@ int igt_sysfs_read(int dir, const char *attr, void
> >> >*data, int len)
> >> >>   */
> >> >>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
> >> >>  {
> >> >> -	int len = strlen(value);
> >> >> +	int len = strlen(value) + 1;
> >> >>  	return igt_sysfs_write(dir, attr, value, len) == len;
> >> >>  }
> >> >>
> >
> >If you agree on limiting this patch to the above chunk and dropping below
> >changes to igt_sysfs_vprintf() which look problematic to me then, with the
> >above discussed mistake corrected, you have my
> 
> humn?? why would we leave the function below broken?

I wouldn't, and that's a misinterpretation of my words, since I didn't say 
that.  As I wrote in my former comments, I just didn't agree with your 
proposed solution.

> 
> 	const char *foo = get_foo_val();
> 	const char *bar = get_bar_val();
> 
> 	igt_sysfs_printf(dirfd, "test_sysfs_file", "%s%s", foo, bar);
> 
> why would we leave igt_sysfs_printf broken, forcing the user to check
> foo and bar and fallback to igt_sysfs_write() or igt_sysfs_set()? It
> seems even a higher level function than igt_sysfs_set() that should
> really abstract that.
> 
> Lucas De Marchi
> 
> >
> >Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> >
> >Thanks,
> >Janusz
> >
> >> >> @@ -513,8 +513,16 @@ int igt_sysfs_vprintf(int dir, const char *attr, const
> >> >char *fmt, va_list ap)
> >> >>  		return -errno;
> >> >>
> >> >>  	va_copy(tmp, ap);
> >> >> -	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
> >> >> +	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
> >> >
> >> >Looks not related.
> >>
> >> I will add a line in the commit message for this sneaking in.
> >>
> >> >
> >> >>  	va_end(tmp);
> >> >> +
> >> >> +	/*
> >> >> +	 * make sure to always issue a write() syscall, even if writing an
> >> >empty string,
> >> >> +	 * otherwise values in sysfs like module parameters don't really get
> >> >overwritten
> >> >> +	 */
> >> >> +	if (igt_debug_on(ret = 0))
> >> >> +		return igt_writen(fd, "", 1);
> >> >
> >> >I think users may know that an empty string is going to be written, then may
> >> >expect return value of 0, not 1.  Also, what value should we return to the
> >> >user if (unlikely) we got 0 from igt_writen()?  write(2) says: "If count is
> >> >zero and fd refers to a file other than a regular file, the results are not
> >> >specified."
> >>
> >> we are passing 1 so we don't fall in the case of passing 0 that write(2)
> >> refers to. If the return value is 0, then we return whatever write()
> >> returned and the user deals with it like it had done before.

With your approach, igt_sysfs_printf() would return the same value of 1 in two 
different cases: when the successfully rendered and written string was either 
of one or zero bytes length.  I don't like it.

Since I don't agree with your approach, I can support only that part of 
your patch that fixes igt_sysfs_set(), in a way free from my doubts.  I'm 
surprised you have understood my lack of acceptance to your changes to 
igt_sysfs_printf() as my vote against fixing that function and leaving it 
broken.  I just left that topic open for further discussion.

Thanks,
Janusz


> >>
> >> >
> >> >While resolving two instances of one and the same issue, you use two different
> >> >approaches:
> >> >1) always increase the number of characters to be written by 1 when writing
> >> >   strings, so at least the terminating null byte is always written,
> >> >2) divert to a separate call to igt_writen() that writes just the terminating
> >> >   null byte when the string to be written is empty.
> >>
> >> if you look with a different angle, both are actually passing len + 1.
> >> One goes directly to igt_written() vs igt_sysfs_write() because of the
> >> arguments it has at hand and is consistent with the layer the specific
> >> function is operating on.
> >>
> >> 	if (igt_debug_on(ret == 0))
> >> 		return igt_writen(fd, stack, ret + 1);
> >>
> >> to be similar would equally work, but slightly harder to understand
> >> what's going on.
> >>
> >> Lucas De Marchi
> >>
> >> >While both methods can work correctly, I think it would be more clear if you
> >> >selected one of them and stuck to it, or provide a justification if not.
> >>
> >>
> >> >
> >> >Thanks,
> >> >Janusz
> >> >
> >> >
> >> >> +
> >> >>  	if (igt_debug_on(ret < 0))
> >> >>  		return -EINVAL;
> >> >>
> >> >>
> >> >
> >> >
> >> >
> >> >
> >>
> >
> >
> >
> >
> 




