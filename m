Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D49E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 07:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA3910E2DA;
	Mon, 16 Dec 2024 07:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjmfkmbD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D599510E2DA
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734334823; x=1765870823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nYg0K2MIhkYUebyntPbgbSpRQGNZKBUbt/+nkHm0BXw=;
 b=EjmfkmbDUaMWFrSkgIEBJ9eF3dXiJdhuabxV//oRa+FiAJiVa+1tfl3X
 69qbjGCTbNnVh5yYGQsUw5BOzXdywH8x1nQmJDPjADq4nRMF8o7lLV3Gh
 fLSp0SeT5vYCktktBAGO9G8g5PP/nggKmMQ5VmhCZldCoOy4vPUuXDNxk
 IKdkUaycNAQ1MUO6EjwqqtCOOaHQZcynmPyOuAxkaO3EVhKSXpg7dMkDC
 S01r7Vd06SMSob98sIlBLqHx5hDsHi81OTHJJStT2Qvt08jaDBUktTMh+
 4xfLEtWXLGVK9Q5N72o7EjbdV8wciz1SCVnyWrWBUMGApq/ZDl1in6CSC w==;
X-CSE-ConnectionGUID: lU6rcXUISN6V3J3OsJ/Ibg==
X-CSE-MsgGUID: jK9ZYsjfS/iIR+g2mgj1uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="52123282"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; d="scan'208";a="52123282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2024 23:40:22 -0800
X-CSE-ConnectionGUID: H1Ry48swRUmQRMRfHOthLQ==
X-CSE-MsgGUID: 6gsrf6uyShaTWz6WjFGs+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; d="scan'208";a="97026968"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.228])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2024 23:40:16 -0800
Date: Mon, 16 Dec 2024 08:40:12 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v13 1/3] lib/igt_facts: Library and unit testing
 for fact tracking
Message-ID: <20241216074012.36tjkyqgjhybtflu@zkempczy-mobl2>
References: <20241216061036.194296-1-peter.senna@linux.intel.com>
 <20241216061036.194296-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216061036.194296-2-peter.senna@linux.intel.com>
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

On Mon, Dec 16, 2024 at 07:10:34AM +0100, Peter Senna Tschudin wrote:

You've probably missed this on my last review, may you check this:

<cut>

> +
> +/**
> + * igt_facts_scan_pci_drm_cards:
> + * @last_test: name of the last test
> + *
> + * This function scans the pci bus for drm cards using udev. It uses the
> + * igt_facts_list_mark(), igt_facts_list_add() and igt_facts_list_sweep() to
> + * update igt_facts_list_drm_card_head.
> + *
> + * Returns: void
> + */
> +static void igt_facts_scan_pci_drm_cards(const char *last_test)
> +{
> +	static struct igt_list_head *head = &igt_facts_list_drm_card_head;
> +	struct udev *udev = NULL;
> +	struct udev_enumerate *enumerate = NULL;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +	int ret;
> +	char *factname = NULL;
> +	char *factvalue = NULL;
> +
> +	if (igt_facts_config.disable_udev)
> +		return; /* Intentinally silent */
> +
> +	udev = udev_new();
> +	if (!udev) {
> +		igt_warn("Failed to create udev context\n");
> +		igt_facts_config.disable_udev = true;
> +		return;
> +	}
> +
> +	enumerate = udev_enumerate_new(udev);
> +	if (!enumerate) {
> +		udev_unref(udev);
> +		return;
> +	}
> +
> +	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = udev_enumerate_scan_devices(enumerate);
> +	if (ret < 0)
> +		goto out;
> +
> +	devices = udev_enumerate_get_list_entry(enumerate);
> +	if (!devices)
> +		goto out;
> +

<start>

> +	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = udev_enumerate_scan_devices(enumerate);
> +	if (ret < 0)
> +		goto out;
> +
> +	devices = udev_enumerate_get_list_entry(enumerate);
> +	if (!devices)
> +		goto out;

<end>

Isn't this duplicate?

--
Zbigniew
