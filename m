Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CF2E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 18:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2260310EEF8;
	Thu,  9 Jan 2025 18:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wp5g+Xkg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FAE10EEF8
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 18:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736446912; x=1767982912;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SFLKA++RGeTF7+8kCIfvtejPQ9P2tLOljh3oeLFy1DI=;
 b=Wp5g+XkglI1loZ3sZt4PwIWxZCjW8fg+5/LH6jlJ79JWGBZfaI/DgFc/
 yD9XSeMmsVvmq1t0zS2QRKgx5x8LsBL1nvrQDcTCFFQD4dC3gJiAtfUfJ
 25cGz8WHS8bqxA5eCxxwskUzrBRLrG0J4hHuRkCmn0l96ktz3vU0Yp6lY
 kAEHRjM1gIoapxj2OUcyJBgzKe2Wr24pa4s14FEkqvGNYaI4yhGT/wy2y
 PlEeVDCdalrdGbU7u9c9aoVHTIr7fP/hpG3odb/UhJ3BX5JGq0/CgCgoE
 vcTPHBM4ToBlCaFQtQ6VpYHsLoJG1pyj+NBZEx+ceHx4ngJcUQvBnko98 w==;
X-CSE-ConnectionGUID: sS1mORfMS9eHZAofwer0uw==
X-CSE-MsgGUID: KrKtTQQ4SuGvkZ8gvNYX4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48086819"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="48086819"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 10:21:52 -0800
X-CSE-ConnectionGUID: f5tzQb3EQRa/dN1AKON3vA==
X-CSE-MsgGUID: vV1qWr9PQLGevhzPSG5f8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="104002175"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 10:21:48 -0800
Message-ID: <e496929e-b3c0-4167-b17e-59138757fbb7@linux.intel.com>
Date: Thu, 9 Jan 2025 19:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC i-g-t] lib/igt_kmemleak: library to interact with
 kmemleak
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
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
 "Yu, Jianshui" <jianshui.yu@intel.com>
References: <20241216184642.133454-1-peter.senna@linux.intel.com>
 <CH0PR11MB54444E8ACF985B488C2E0C01E5112@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Z34Lz0Zd4X_mfGHf@bvivekan-mobl1>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <Z34Lz0Zd4X_mfGHf@bvivekan-mobl1>
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

Dear Bala,

Thank you for your review!

[...]

>>> +static void test_igt_kmemleak_cp_leaks_file(void)
>>> +{
>>> +	char dst_file_path[256] = "/tmp/igt_kmemleak_dstfile_XXXXXX";
>>> +	int fd;
>>> +	unsigned long crc;
>>> +
>>> +	fd = mkstemp(dst_file_path);
>>> +	close(fd);
>>> +
>>> +	igt_assert(igt_kmemleak_cp_leaks_file(dst_file_path));
>>> +
>>> +	/* Test that both files have the same size */
>>> +	fd = open(dst_file_path, O_RDONLY);
>>> +	igt_assert(fd >= 0);
>>> +	igt_assert(lseek(fd, 0, SEEK_END) == strlen(kmemleak_file_example));
>>> +	close(fd);
>>> +
>>> +	/* Test that both files have the same content */
>>> +	crc = crc32(0, Z_NULL, 0);
>>> +	crc = crc32(crc,
>>> +		    (const Bytef *)kmemleak_file_example,
>>> +		    strlen(kmemleak_file_example));
> 
> Did you miss the changes to compare the CRC?

Not only that, but I did not use crc32_file()... Thank you for catching this!
Fixed on V1.

> 
> Regards,
> Bala
> 

[...]
