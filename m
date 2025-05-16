Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66634C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 05:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ABD10E9A2;
	Fri, 16 May 2025 05:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FkZoGJpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C6610E9C2
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 05:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747374410; x=1778910410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1Kg6OK7o7S6KefFZ54AebEGrDsQ3zNF2JQHHbR/RlyY=;
 b=FkZoGJplzRaTrxf0FKh3c8aaadOEqvSBlqBBAxUzN+Y4X2Ki1UUex8WK
 KMf3HqmmW6O0Wrv2OoC4w9ClxMVkHPh8pMk9i5rBO7X1071b3qf8Qd+bg
 MsfTNlC/lnMhlyxkuZ0thCoO/sUDkRpeGzWMB+Sg2V2hhVQRC2mMOPSdt
 dDqZ4OyYeku/p125aKjMXweDOMLAimth/dZ+rBfrMggtYPWCgi0WYo4XK
 E7jiqGlD3MznzEDqs2KUicCtUYM0x4jJf1CSn9kIL7G/lSsqQFq+x80R4
 d0EMDGQLknjseXDnlr6DNyf6a8bebCSQ0wy+GM777Phpl5CIlUgzvck29 A==;
X-CSE-ConnectionGUID: 9Rt2LXYDSKulqmPen4k9xA==
X-CSE-MsgGUID: tJ0NUulST2GNo5pAJRQz4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48586930"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="48586930"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:46:49 -0700
X-CSE-ConnectionGUID: Q5Uq782XSTWcmTCkdc4ixw==
X-CSE-MsgGUID: XzVvj/2jSVeZCqLCZyzbvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="139595446"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.80])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:46:46 -0700
Date: Fri, 16 May 2025 07:46:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com, 
 himanshu.girotra@intel.com, aditya.chauhan@intel.com,
 pravalika.gurram@intel.com, 
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [RFC i-g-t 2/5] lib/igt_dir_explorer: Add function to
 recursively read all files in a directory
Message-ID: <3vljx2gprvygiii3v3ipvvzg42cg2c3wtjnxrrrvfpzhzr245j@2zqrvvb7tfxb>
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
 <20250514175140.115033-3-peter.senna@linux.intel.com>
 <ogha6otctbafhcqe5pokhjszogz6rzm2h7cdpxjssvvpiyf5md@xygjmjrvzcgd>
 <21e8b10e-f47e-455f-b6be-306e7eb2eb33@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21e8b10e-f47e-455f-b6be-306e7eb2eb33@linux.intel.com>
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

On Thu, May 15, 2025 at 06:40:09PM +0200, Peter Senna Tschudin wrote:

<cut>

> > Just loose thought - if you're doing recursive directory traversal,
> > wouldn't be better to pass function (kind of callback) which would be
> > called for each file/dir entry? I mean single traversal code, and
> > multiple callbacks for different use cases.
> What about?
> 
> /* Callback function type for processing files. I guess we should make
>  * it blocking. Wait for the function to return before starting the next
>  * file.
>  */
> typedef int (*igt_dir_exp_file_callback)(int filefd);

I thought about:

typedef int (*handler)(const char *filename, int flags);

> 
> /* reading order */
> typedef enum {
>     SCAN_ORDER_SEQUENTIAL,
>     SCAN_ORDER_RANDOM
> } igt_dir_exp_scan_order_t;
> 
> /* Struct to hold the library interface */
> typedef struct {
>     int dirfd;                          /* File descriptor of the directory to scan */
>     igt_dir_exp_file_callback callback; /* Callback function for file operations. If null defaults
>                                          * to read and discard */
>     const char *include_pattern;        /* Pattern to match files to include (glob or regex) */
>     const char *exclude_pattern;        /* Pattern to match files to exclude (glob or regex) */
>     uint32_t concurrency;               /* Number of threads, default is 1 */
>     size_t max_depth;                   /* Maximum directory depth to scan. -1 no limit */
>     size_t max_files;                   /* Maximum number of files to process.  -1 no limit */
>     size_t max_bytes;                   /* Maximum bytes to read on each file. -1 no limit */
>     scan_order_t reading_order;         /* Reading order (sequential or random) */
> } igt_dir_exp_file_scan_config_t;
> 
> /* Function prototype for the library function */
> int igt_dir_exp_scan_directory(const igt_dir_exp_file_scan_config_t *config);
> 

void igt_dir_config_scan(struct igt_dir_scan *scan,
			 const char *include_pattern,
			 const char *exclude_pattern,
			 int max_depth);

void igt_dir_perform_scan(const struct igt_dir_scan *scan,
		          int (*handler)(const char *filename, int flags),
		          int flags);


Flags might be used to pass some additional information to the handler.
It might be void *, whatever. Even you may omit it now (there's only
single code which will use it so maybe isn't worth to extend this
too much on the beginning).

But don't get attached to names I proposed, change them to correspond
the code.

--
Zbigniew

