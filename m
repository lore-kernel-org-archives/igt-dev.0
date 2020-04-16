Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C19B6E2E8
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 15:16:10 +0000 (UTC)
Date: Thu, 16 Apr 2020 20:36:18 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200416150617.GL5533@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [QUERY] equivalent of kmstest_unset_all_crtcs() without
 drm_res. igt_output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Need some input on igt development,
kmstest_unset_all_crtcs() requires drm_res but if we already have igt_display_t display resource,
then we shouldn't be requiring drm_res.

drmModeSetCrtc(drm_fd, resources->crtcs[i], 0, 0, 0, NULL,0, NULL);

Is it correct to replicate disbaling crtc instead above drmModeSetCrtc call with below two statements.

igt_output_set_pipe(data->output, PIPE_NONE);
igt_display_commit(&data->display);

Thanks,
Anshuman Gupta.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
