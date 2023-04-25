Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Tue, 25 Apr 2023 13:19:24 -0700
Message-Id: <20230425201926.99086-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t 0/2] Update intel_error_decode for Gen12
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The error capture decoder was reporting invalid errors in batch
buffers and getting confused about the prescence of the GuC CTB. So
fix those up.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  lib/intel_decode: Decode Gen12 ring/batch instructions correctly
  tools/intel_error_decode: Correctly name the GuC CT buffer

 lib/i915/intel_decode.c    | 15 +++++++++++++--
 tools/intel_error_decode.c |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.39.1


