Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A333910E5EF
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 20:23:57 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Aug 2023 13:23:38 -0700
Message-ID: <20230810202340.2388-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v3 0/2] add support for passing yuv
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

./kms_writeback -d -f <name of the DRM YUV fmt from igt_fb>

Currently this is supported only along with the --dump option because
the API which computes CRC needs to be extended to handle formats
which have more than one plane.

changes in v2:
	- removed an unnecessary new line
	- fixed petri's email address

changes in v3:
	- drop the changes to igt_fb_get_fnv1a_crc()
	- restrict the custom format to only the --dump option

Abhinav Kumar (2):
  lib/igt_fb: add a helper to find drm_id from matching string
  tests/kms_writeback: allow writeback to output custom format

 lib/igt_fb.c          | 28 ++++++++++++++++++++++++++++
 lib/igt_fb.h          |  3 +++
 tests/kms_writeback.c | 18 +++++++++++++++---
 3 files changed, 46 insertions(+), 3 deletions(-)

-- 
2.40.1
