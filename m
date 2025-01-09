Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA131E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 18:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A9210EE95;
	Thu,  9 Jan 2025 18:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fm/rkSt2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275BF10EE95
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736446725; x=1767982725;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xw/LXahkrE8ilVZm5wXTWJl4CDEsbdqk8k9MdQchgCo=;
 b=Fm/rkSt2EvPU4AE8ESX0JicKOzzMWgUS7MuL8wGBdVPH/oj3R1oMv8XZ
 qE2wfJejOciKauwT14IEKfGsMAetJ/Uie5IR+AzJgmYA4eMh1UvGqhAsB
 Por6zTQydjKV8l6X2KbIn7/g4g6wAAZiszVmzv5xwaldq50EP1xXZBB/k
 KibpvTfVArL9DLUQq3Gyeu/OpJSVoeAHjYq22LhkxgJmNFXk1OIuSXKip
 On0LP4T1N0hZqij7KmqY53ZG/6cBs9nV1QmM2FHImZp4d/ck4f2AgenEh
 34l4wcx2DxwqWNCYSYsyzfsBI0WiabnqawE+MS4HvUuijqIedO5gdszEE g==;
X-CSE-ConnectionGUID: eRKIzKeeTEqoboKrcruPMw==
X-CSE-MsgGUID: ATW0KRzkSZKNoAsCUAitwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36008101"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36008101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 10:18:45 -0800
X-CSE-ConnectionGUID: mLWxRre1TOePTX2Bo8DJhA==
X-CSE-MsgGUID: 4K/VGHUjQYqk9kwPi1qIog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="103676937"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 10:18:41 -0800
Message-ID: <6513074d-58d4-4df0-881b-ad4e99147304@linux.intel.com>
Date: Thu, 9 Jan 2025 19:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC i-g-t] lib/igt_kmemleak: library to interact with
 kmemleak
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Senna, Peter" <peter.senna@intel.com>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "gregory.f.germano@intel.com" <gregory.f.germano@intel.com>,
 "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Yu, Jianshui" <jianshui.yu@intel.com>
References: <20241216184642.133454-1-peter.senna@linux.intel.com>
 <CH0PR11MB54444E8ACF985B488C2E0C01E5112@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <CH0PR11MB54444E8ACF985B488C2E0C01E5112@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear Jonathan,

Please see my comments below.

[...]

> 
> I'm not particularly well-versed in kmemleak, but nothing about this patch seems out of the
> ordinary.  Though I can still offer some small style-related suggestions.
> Also, do you want a reviewed-by for this?  I'd give one right now but I don't think I should be
> Acking RFC patches.

I sent V1 a few instants ago, I guess it is a better place for a RB.

[...]

> 
> Maybe we can reduce the number of fclose calls by capturing the fwrite return value:
> """
> bool igt_kmemleak_cmd(const char *cmd)
> {
> 	FILE *fp;
> 	size_t wlen;
> 
> 	fp = fopen(igt_kmemleak_file, "r+");
> 	if (!fp)
> 		return false;
> 
> 	wlen = fwrite(cmd, 1, strlen(cmd), fp);
> 	fclose(fp);
> 
> 	return wlen == strlen(cmd);
> }
> """
> Though that's not strictly necessary here.

Thank you for that! This change is on V1.

[...]

> 
> Same comment as with igt_kmemleak_cmd above:
> """
> bool igt_kmemleak_found_leak(void)
> {
> 	FILE *fp;
> 	char buf[1];
> 	size_t rlen;
> 
> 	fp = fopen(igt_kmemleak_file, "r");
> 	if (!fp)
> 		return false;
> 
> 	rlen = fread(buf, 1, 1, fp);
> 	fclose(fp);
> 
> 	return rlen > 0;
> }
> """
> Though, again, this isn't strictly necessary.

Thank you for that! This change is on V1.

[...]

> 
> I don't think we need comments like this for both the implementation
> and the header file.  The former should be sufficient.

Removed comments from the header file on V1.

[...]

> 
> test_empty_file and test_non_empty_file could probably be consolidated into a single
> "test_file" or "test_kmemleak_file" test with a Boolean determining if we want to write
> to the test file or not:
> """
> static void test_kmemleak_file(bool write)
> {
> 	char tmp_file_path[256] = "/tmp/igt_kmemleak_test_XXXXXX";
> 	int fd = mkstemp(tmp_file_path);
> 	igt_assert(fd >= 0);
> 
> 	if (write)
> 		write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
> 
> 	/* Set the path for the unit testing file */
> 	igt_assert(igt_kmemleak_init(tmp_file_path));
> 	
> 	/* Test igt_kmemleak_found_leaks() returns true if written */
> 	igt_assert(igt_kmemleak_found_leaks() == write);
> 
> 	close(fd);

I moved the shared part to test_kmemleak_file() but kept the two separate functions
for the differences between them.

[...]

> 
> It might be better to separate these out into their own subtests:
> """
> 	igt_subtest_f("empty-file")
> 		test_empty_file();
> 	igt_subtest_f("non-empty-file")
> 		test_non_empty_file();
> 	igt_subtest_f("cp-leaks-file")
> 		test_igt_kmemleak_cp_leaks_file();
> """

Unfortunately this does not work. These are unit testing tests, and `meson test -C build`
gets confused by the macro igt_subtest_f. That or I am doing something wrong.


> 
> Though looking at it a bit closer, I see that test_igt_kmemleak_cp_leaks_file depends
> on the completion of test_non_empty_file to run properly?  Maybe we should separate
> the test out into chunks?

Oh, test_igt_kmemleak_cp_leaks_file() was broken. I changed it so that it has no dependencies,
and that it uses crc32_file()...

> 
> Let me try prototyping it here:
> """
> --- Original file up to end of crc32_file function is unchanged ---
> 
> static void init_kmemleak_file(bool write)
> {
> --- Same as test_kmemleak_file from earlier suggestion ---
> }
> 
> static void test_kmemleak_cp_leaks_file(void)
> {
> 	char dst_file_path[256] = "/tmp/igt_kmemleak_dstfile_XXXXXX";
> 	int fd;
> 	unsigned long crc;
> 
> 	init_kmemleak_file(true);
> 
> 	fd = mkstemp(dst_file_path);
> --- Rest of test is unchanged after this point ---
> }
> 
> igt_main
> {
> 	igt_subtest_f("empty")
> 		init_kmemleak_file(false);
> 	igt_subtest_f("non-empty")
> 		init_kmemleak_file(true);
> 	igt_subtest_f("cp-leaks-file")
> 		test_kmemleak_cp_leaks_file();
> }
> """

It ended slightly different than that. Let me know what you think.

Thank you!
