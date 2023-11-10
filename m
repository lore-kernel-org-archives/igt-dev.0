Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, contact@emersion.fr,
 dri-devel@lists.freedesktop.org
Date: Fri, 10 Nov 2023 11:38:09 -0500
Message-ID: <20231110163811.24158-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add test for atomic async page flip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series adds tests for async page flip for DRM Atomic API. Kernel patches:
https://lore.kernel.org/dri-devel/20231025005318.293690-1-andrealmeid@igalia.com/

André Almeida (1):
  tests/kms_async_flips: Add test for atomic prop changes

Simon Ser (1):
  tests/kms_async_flips: add atomic test

 include/drm-uapi/drm.h  |   8 +++
 tests/kms_async_flips.c | 105 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

-- 
2.42.1
