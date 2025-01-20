Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60207C02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 13:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2244510E415;
	Mon, 20 Jan 2025 13:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0ynZJ5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B43F10E415
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737380360; x=1768916360;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=B7+rmtLPtqMeQJnJFfAadoYLcA9yOkJd849Wa9jPaOg=;
 b=f0ynZJ5m94ZLWPsu5L3efTvxnRW3Cmp4XIAhu3azUIDSNlLjAIkB5WJi
 h5RSF7cQpuCpEfmoJy8pxKoyE/89X0fAQTwfYKQMm2Mq8u7VOBqInaGci
 83AiKbWr3A+6UieyF54hVvUhehDuUyvoeNEdOFBIa4TC68ipoV4wQQjuv
 O4mTVYH1kWVME1MBPGpjnEryWigj1btSSAuLjKDcVg5O4j1TDJYPMafDS
 32qM3QZ4qLzDGyaB/E+VdnMIUadD6neNNHPG/5bnIEYVgI4/rh51cx0aK
 2aJekQIH0bBADo7gyk9s69J3greD+XcmImRmF60Q3yVe/7eNlgL6Fhkce A==;
X-CSE-ConnectionGUID: jn1D2y2KRZi7yLFSjQg+bA==
X-CSE-MsgGUID: ecSC6g6RTsC5vZrSSfPO9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41533785"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="41533785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 05:39:19 -0800
X-CSE-ConnectionGUID: W2OtmY49ToKJi71bxlX+TA==
X-CSE-MsgGUID: lLPaP+J/S6SAUsiUA7OBlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="106644217"
Received: from zhenyiz1-mobl.ccr.corp.intel.com (HELO [10.245.113.241])
 ([10.245.113.241])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 05:39:18 -0800
Message-ID: <64b1ae2e-e096-4da5-8233-2669bbd816be@linux.intel.com>
Date: Mon, 20 Jan 2025 14:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: RFC: Do we want a new igt_write() function?
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

Dear List,

I find myself wanting to repeat some small variation of a write function
that retries on recoverable errors and that aborts on unrecoverable errors.
Is the idea of an igt_write() function a welcome addition to lib/igt_core?

Something like:

#define MAX_WRITE_RETRIES 5
/**
 * igt_write - Writes the buffer to the file descriptor retrying when possible.
 * @fd: The file descriptor to write to.
 * @buf: Pointer to the data to write.
 * @count: Total number of bytes to write.
 *
 * Returns the total number of bytes written on success, or -1 on failure.
 */
ssize_t igt_write(int fd, const void *buf, size_t count) {
	const char *ptr = buf;
	size_t remaining = count;
	ssize_t written;
	int retries = 0;

	while (remaining > 0) {
		written = write(fd, ptr, remaining);
		if (written > 0) {
			ptr += written;
			remaining -= written;
		} else if (written == -1) {
			if (errno == EINTR || errno == EAGAIN) {
				/* Retry for recoverable errors */
				if (++retries > MAX_WRITE_RETRIES) {
					igt_err("igt_write: Exceeded retry limit\n");
					return -1;
				}
				continue;
			} else {
				/* Log unrecoverable error */
				igt_err("igt_write: unrecoverable write error");
				return -1;
			}
		}
	}
	return count;
}

Thanks,

Peter
