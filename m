Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750CB10E22E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 03:47:32 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 7 Aug 2023 20:47:09 -0700
Message-ID: <20230808034713.6805-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 0/3] add support for passing yuv
 writeback output format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

MSM display pipeline has support for writeback to handle YUV formats.
Currently the kms_writeback supports hard-codes the writeback output
format to DRM_FORMAT_XRGB8888. This series makes the necessary changes
in the lib and kms_writeback to allow passing DRM YUV formats to
kms_writeback.

The default kms_writeback shall still use only DRM_FORMAT_XRGB8888.

Additional formats can be passed using the command line.

Sample usage of this would be:

./kms_writeback -f <name of the DRM YUV fmt from igt_fb>

changes in v2:
	- removed an unnecessary new line
	- fixed petri's email address

Abhinav Kumar (3):
  lib/igt_fb: add a helper to find drm_id from matching string
  lib/igt_fb: allow igt_fb_get_fnv1a_crc() to handle YUV formats
  tests/kms_writeback: allow writeback to output custom format

 lib/igt_fb.c          | 33 +++++++++++++++++++++++++++++++--
 lib/igt_fb.h          |  3 +++
 tests/kms_writeback.c | 34 ++++++++++++++++++++++++----------
 3 files changed, 58 insertions(+), 12 deletions(-)

-- 
2.40.1
