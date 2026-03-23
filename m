Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430AFF483C6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F242B10E0AA;
	Mon, 23 Mar 2026 16:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UV4E9vdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2177E10E0AA
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774283190; x=1805819190;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N6FzJ+63JDbEKLiDh90mpircXopcxjDL7h+zigmH3fU=;
 b=UV4E9vdpvqon2MKku9yM0MqL1g8x+A7gYChcwtKxeOgDwPcAw/9z2ie+
 Y56x51d9xQ55qwmY0oTFyULgVPhR0FIwWEemY1yVF5n6wR26yJ70fVUkm
 ibUGTvUZe/56FkSTSCrbLpZnlQiSt6Mz11zoYxfbu/JeFb71oqSbW/8nC
 HMeAIWfEQ51D/T2ryJ4Cyml9j16IKz5ArHkhzrMxrjLbPnZS5iAWxCz/W
 1WHKfO+k9DTWEToa91QWJ9llulvhnUmjky6y1SKoPILCKmPDlZNUMvBfs
 z3yz0hEU2Y/oBEqdl0Z5WJfuTGNxVVt5kSsjo67zC11U1sHFDOg+e81d0 w==;
X-CSE-ConnectionGUID: PZbSJw3hSNi1MDibHG/yIw==
X-CSE-MsgGUID: wN8IrVP7Qu6OMhZzqXVFnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79196641"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="79196641"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 09:26:30 -0700
X-CSE-ConnectionGUID: oZDmexrSRb2qcqggKhLeuA==
X-CSE-MsgGUID: KyGt6V0PRwybUg+vtAQ9dg==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:26:28 -0700
Date: Mon, 23 Mar 2026 17:26:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 29/49] lib/unigraf: Add helpers to read and
 write edid
Message-ID: <20260323162610.guykjqlaqut5aeq4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-29-a01dffc3b0cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-unigraf-integration-v9-29-a01dffc3b0cb@bootlin.com>
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

Hi Louis,
On 2026-03-16 at 17:17:50 +0100, Louis Chauvet wrote:
> Read and writing EDID on unigraf can be useful to emulate different
> screens, add helpers to read and write them.
> 
> There is a limitation on the libTSI.so, it is only possible to read EDID
> using buffers of size multiple of 128 bytes, and there is no way to query
> the actual EDID size. The current implementation can only read EDID up to
> 2048 bytes.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/unigraf/unigraf.h |  4 ++++

Please move all unigraf libs into lib/vendors/unigraf/
similar to uwildmat use case.

>  2 files changed, 63 insertions(+)
> 
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index b752ff573ace..d06da6742e95 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -56,6 +56,11 @@ static char *unigraf_connector_name;
>   */
>  #define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
>  
> +/**
> + * EDID_MAX_SIZE - Max EDID size that can be read from the unigraf. The
> + */
> +#define EDID_MAX_SIZE 2048
> +

Is this unigraf specific? For local def maybe UNIGRAF_EDID_MAX_SIZE?

Regards,
Kamil

>  static void unigraf_close_device(void)
>  {
>  	if (!unigraf_device)
> @@ -127,6 +132,20 @@ static void unigraf_init(void)
>  		value;												\
>  	})
>  
> +/**
> + * unigraf_write() - Helper to write a value to unigraf
> + * @config: config id to write
> + * @data: data to write
> + * @data_len: length of the data
> + * Returns
> + */
> +static void unigraf_write(TSI_CONFIG_ID config, const void *data, size_t data_len)
> +{
> +	unigraf_debug("Writing %zu bytes to 0x%x\n", data_len, config);
> +
> +	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config, data, data_len));
> +}
> +
>  /**
>   * unigraf_device_count() - Return the number of scanned devices
>   *
> @@ -329,6 +348,46 @@ void unigraf_reset(void)
>  	unigraf_set_sst();
>  }
>  
> +/**
> + * unigraf_read_edid() - Read the EDID from the specified stream
> + * @stream: The stream ID to read the EDID from
> + * @edid_size: Pointer to an integer where the size of the EDID will be stored
> + *
> + * Returns: A pointer to the EDID structure, or NULL if the operation failed. The caller
> + * is responsible to free this pointer.
> + */
> +struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
> +{
> +	void *edid;
> +
> +	unigraf_debug("Read EDID for stream %d...\n", stream);
> +
> +	edid = calloc(EDID_MAX_SIZE, sizeof(char));
> +
> +	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
> +	*edid_size = unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device,
> +							  TSI_EDID_TE_INPUT,
> +							  edid, EDID_MAX_SIZE));
> +
> +	return edid;
> +}
> +
> +/**
> + * unigraf_write_edid() - Write EDID data to the specified stream
> + * @stream: The stream ID to write the EDID to
> + * @edid: Pointer to the EDID structure to write
> + * @edid_size: Size of the EDID data in bytes
> + *
> + * This function writes the provided EDID data to the specified stream.
> + */
> +void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size)
> +{
> +	unigraf_debug("Write EDID for stream %d...\n", stream);
> +
> +	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
> +	unigraf_write(TSI_EDID_TE_INPUT, edid, 2048);
> +}
> +
>  /**
>   * unigraf_hpd_assert() - Assert Hot Plug Detect signal
>   *
> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
> index c2caa9c2c54c..40f706ebd483 100644
> --- a/lib/unigraf/unigraf.h
> +++ b/lib/unigraf/unigraf.h
> @@ -42,6 +42,10 @@ void unigraf_require_device(int drm_fd);
>  
>  void unigraf_reset(void);
>  
> +struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
> +
> +void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size);
> +
>  void unigraf_hpd_deassert(void);
>  
>  void unigraf_hpd_pulse(int duration);
> 
> -- 
> 2.52.0
> 
