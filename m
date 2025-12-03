Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810A2D15DB7
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 17:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6EF10E189;
	Wed,  3 Dec 2025 17:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8aY+BT8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200E110E189
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 17:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764782797; x=1796318797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yMvu9nRgWDkNX47M7wuBkVBGag43Toz5MSU1GTqlVLw=;
 b=h8aY+BT8ZyCr+wUXC/Wftdphg5BsZlNbLY+8Q+wvHeO3W5/97xrhSbuo
 Pj+hCXXtEMWGnwybnAmmXRbdz0E66deeRQ97QqkAFt1mM6Q1ImKgOF9cy
 iSZbgjikd2abDw004hgjK2gxcQjAL8+dg7Iy82XYPz0TdyfBQ/KlE6Rm3
 /HR3SmV+v6YWB0bbN26QgwRyy9j3dU0ghVBpdc29kajrNcY4HUudZFU1f
 DIK4szKnVU2zyNN/YSTc+oGvL4yvjRPRr6kyNTQu1w+fSaSzrI1XNsydU
 0/9oUZORiSRriZHc82MB/9i94B2h2B5lYVW7iElosLyAYNHZons6WYnAt g==;
X-CSE-ConnectionGUID: GcfhHqtZTLC5J/KJcTdgvg==
X-CSE-MsgGUID: z2vU3iN+TfCKn8Bqaag0eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92264218"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="92264218"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:26:36 -0800
X-CSE-ConnectionGUID: GZ+LcwwpQlCY9qoiRHbQBg==
X-CSE-MsgGUID: 2BDvoASnRh2oMXEmsICX6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="194404641"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 09:26:36 -0800
Date: Wed, 3 Dec 2025 18:26:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/7] igt: Make igt_fixture look like an iterator
Message-ID: <20251203172633.6iv3f5tdocj4sdkt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <20251120191415.4236-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120191415.4236-2-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2025-11-20 at 21:14:09 +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Turn igt_fixture into igt_fixture(). This allows coccinelle
> to parse it when given a helping hand with the
> 'iterator name igt_fixture' directive.
> 
> Conversion done via:
> $ find -type f -name \*.[ch] -exec sed -i 's/\([^_]\)igt_fixture/\1igt_fixture()/g' {} +
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

I could ack this series but before merging please add at least one,
non-trivial patch which makes actual change with cocci.

Regards,
Kamil

[cut]
