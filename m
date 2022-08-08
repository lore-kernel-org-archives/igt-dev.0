Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DA91130A3
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 16:32:57 +0000 (UTC)
Message-ID: <9d97d528-954b-5bd0-2ee8-7b6a50a842bb@quicinc.com>
Date: Mon, 8 Aug 2022 09:32:55 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rohith Iyer <quic_rohiiyer@quicinc.com>, <igt-dev@lists.freedesktop.org>
References: <20220804220235.26076-1-quic_rohiiyer@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220804220235.26076-1-quic_rohiiyer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v6 0/3] kms_writeback enhancements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Series has been applied and merged. Thanks!

- Jessica Zhang

On 8/4/2022 3:02 PM, Rohith Iyer wrote:
> Add support for testing built-in or custom modes for kms_writeback,
> support for dumping output buffer to png file, and standardize mode
> string formats with igt_parse_mode_string helper.
> 
> This patch series was originally a standalone patch, based on review
> comments, is being resent as this series.
> 
> Link to original patch: https://patchwork.freedesktop.org/patch/490780/?series=105522&rev=6
> 
> Changes in this series:
>   - Changed name of "standard" modes to "built-in".
>   - Added new environmental variable, $FRAME_PNG_FILE_NAME for specifying filename.
>   - Created igt_parse_mode_string to standardize mode string format.
>   - Called igt_parse_mode_string instead of sscanf.
> 
> Changes made in V4:
>   - Added header for writeback mode list
>   - Corrected commit text and documentation
>   - Changed *mode_string to a const char from char
>   - Changed built-in mode short option from -s to -b for clarity
> 
> Changes made in V5:
>   - Removed angle brackets in documentation which cause parse error in builddoc
> 
> Changes made in V6:
>   - Fixed alignment for function arguments spilling over one line
> 
> Rohith Iyer (3):
>    lib/igt_kms: Add helper to parse mode string
>    tests/testdisplay: Use igt_parse_mode_string for command line
>      arguments
>    tests/kms_writeback: Enhance kms_writeback for custom modes
> 
>   lib/igt_kms.c         |  26 +++++++
>   lib/igt_kms.h         |   1 +
>   tests/kms_writeback.c | 173 +++++++++++++++++++++++++++++++++++++-----
>   tests/testdisplay.c   |   8 +-
>   4 files changed, 181 insertions(+), 27 deletions(-)
> 
> -- 
> 2.17.1
> 
